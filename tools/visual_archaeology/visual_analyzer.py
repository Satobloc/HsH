#!/usr/bin/env python3
"""Transparent visual-feature extractor and rule scorer for SAT/H(s)H archive images.

No semantic tag is ground truth unless supplied by a human/source record.
The analyzer emits measurements, rule contributions, and candidate tags separately.
"""
from __future__ import annotations
import argparse, colorsys, hashlib, json, math, os, re
from pathlib import Path
try:
    from PIL import Image, ImageFilter
except ImportError as e:
    raise SystemExit("Pillow required: pip install pillow") from e

PALETTES={
 "red_magenta": [(345,360),(0,25),(300,344)],
 "cyan_blue": [(175,260)],
 "green": [(75,174)],
 "warm": [(20,74)],
}
def circ_hue(rgb):
    r,g,b=[x/255 for x in rgb]; h,s,v=colorsys.rgb_to_hsv(r,g,b); return h*360,s,v
def region_stats(im,box):
    crop=im.crop(box).convert("RGB").resize((64,64))
    n=64*64; bins={k:0 for k in PALETTES}; gray=dark=light=0
    for rgb in crop.getdata():
        h,s,v=circ_hue(rgb)
        if s<.12: gray+=1
        if v<.18: dark+=1
        if v>.82: light+=1
        for k,ranges in PALETTES.items():
            if s>.20 and any(a<=h<=b for a,b in ranges): bins[k]+=1; break
    return {**{k:round(v/n,4) for k,v in bins.items()},"gray":round(gray/n,4),"dark":round(dark/n,4),"light":round(light/n,4)}
def edge_stats(im):
    g=im.convert("L").resize((256,256)).filter(ImageFilter.FIND_EDGES)
    px=list(g.getdata()); return {"edge_mean":round(sum(px)/(255*len(px)),4),"edge_high":round(sum(v>80 for v in px)/len(px),4)}
def dist(a,b,keys=("red_magenta","cyan_blue","green","warm","gray","dark","light")):
    return sum(abs(a[k]-b[k]) for k in keys)/len(keys)
def analyze(path):
    p=Path(path); im=Image.open(p); w,h=im.size
    whole=region_stats(im,(0,0,w,h)); left=region_stats(im,(0,0,w//2,h)); right=region_stats(im,(w//2,0,w,h))
    top=region_stats(im,(0,0,w,h//2)); bottom=region_stats(im,(0,h//2,w,h))
    feats={"path":str(p),"sha256":hashlib.sha256(p.read_bytes()).hexdigest(),"width":w,"height":h,
      "aspect":round(w/h,4),"square":abs(w-h)<=max(2,.005*max(w,h)),"whole":whole,"left":left,"right":right,
      "top":top,"bottom":bottom,"lr_color_distance":round(dist(left,right),4),"tb_color_distance":round(dist(top,bottom),4),**edge_stats(im)}
    scores={}
    def add(tag,weight,reason):
        scores.setdefault(tag,{"score":0.0,"evidence":[]});scores[tag]["score"]+=weight;scores[tag]["evidence"].append({"weight":weight,"reason":reason})
    low=str(p).lower()
    if "thumbnail" in low: add("thumbnail",3,"filename/path contains thumbnail")
    if feats["square"]: add("thumbnail",1,"image is exactly/nearly square")
    if whole["gray"]>.70: add("mostly_bw",2,f"grayscale fraction {whole['gray']}")
    if left["gray"]>.65 and right["gray"]<.45: add("bw_left_color_right",1.5,"left substantially more grayscale than right")
    if right["gray"]>.65 and left["gray"]<.45: add("color_left_bw_right",1.5,"right substantially more grayscale than left")
    if feats["lr_color_distance"]>.13: add("split_field_candidate",1.5,f"left/right color distance {feats['lr_color_distance']}")
    if (left["cyan_blue"]>.25 and right["red_magenta"]>.25): add("cyan_left_magenta_right",2.5,"opposed half-field color occupancy")
    if (right["cyan_blue"]>.25 and left["red_magenta"]>.25): add("magenta_left_cyan_right",2.5,"opposed half-field color occupancy")
    if whole["red_magenta"]>.25: add("red_magenta_dominant",1.5,f"occupancy {whole['red_magenta']}")
    if whole["cyan_blue"]>.25: add("cyan_blue_dominant",1.5,f"occupancy {whole['cyan_blue']}")
    if feats["edge_high"]>.20: add("high_edge_density",1,f"strong-edge fraction {feats['edge_high']}")
    return {"features":feats,"candidates":scores}
def main():
    ap=argparse.ArgumentParser();ap.add_argument("images",nargs="+");ap.add_argument("-o","--output")
    a=ap.parse_args(); out=[analyze(x) for x in a.images]; s=json.dumps(out,indent=2)
    Path(a.output).write_text(s+"\n") if a.output else print(s)
if __name__=="__main__": main()
