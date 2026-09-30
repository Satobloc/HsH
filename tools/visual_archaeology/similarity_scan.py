#!/usr/bin/env python3
"""Transparent duplicate / near-duplicate scanner for archive images.

Uses cryptographic identity plus two small perceptual hashes. It is deliberately
not a semantic classifier: low Hamming distance is evidence of visual similarity,
not proof that two images have the same meaning.
"""
from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from PIL import Image, ImageOps

IMAGE_EXTS={".png",".jpg",".jpeg",".webp",".gif",".bmp",".tif",".tiff"}


def sha256(path: Path) -> str:
    h=hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda:f.read(1024*1024),b""):
            h.update(chunk)
    return h.hexdigest()


def bits_to_hex(bits):
    n=0
    for b in bits:n=(n<<1)|int(bool(b))
    return f"{n:0{(len(bits)+3)//4}x}"


def ahash(im: Image.Image, size=16) -> str:
    g=ImageOps.grayscale(im).resize((size,size))
    p=list(g.getdata()); mean=sum(p)/len(p)
    return bits_to_hex(v>=mean for v in p)


def dhash(im: Image.Image, size=16) -> str:
    g=ImageOps.grayscale(im).resize((size+1,size))
    p=list(g.getdata()); bits=[]
    for y in range(size):
        row=p[y*(size+1):(y+1)*(size+1)]
        bits.extend(row[x]>row[x+1] for x in range(size))
    return bits_to_hex(bits)


def hamming(a: str,b: str) -> int:
    return (int(a,16)^int(b,16)).bit_count()


def record(path: Path):
    with Image.open(path) as im:
        w,h=im.size
        return {"path":str(path),"width":w,"height":h,"aspect":round(w/h,6),
                "sha256":sha256(path),"ahash":ahash(im),"dhash":dhash(im)}


def iter_images(paths):
    seen=set()
    for raw in paths:
        p=Path(raw)
        candidates=(p.rglob("*") if p.is_dir() else [p])
        for x in candidates:
            if x.is_file() and x.suffix.lower() in IMAGE_EXTS:
                q=str(x.resolve())
                if q not in seen:
                    seen.add(q); yield x


def union_find(n):
    parent=list(range(n))
    def find(x):
        while parent[x]!=x:
            parent[x]=parent[parent[x]];x=parent[x]
        return x
    def union(a,b):
        a,b=find(a),find(b)
        if a!=b:parent[b]=a
    return parent,find,union


def scan(paths,threshold=12,aspect_tolerance=.03):
    rec=[record(p) for p in iter_images(paths)]
    parent,find,union=union_find(len(rec)); pairs=[]
    for i in range(len(rec)):
        for j in range(i+1,len(rec)):
            a,b=rec[i],rec[j]
            if a["sha256"]==b["sha256"]:
                pairs.append({"a":a["path"],"b":b["path"],"relation":"byte_identical","distance":0});union(i,j);continue
            if abs(a["aspect"]-b["aspect"])>aspect_tolerance:continue
            d1=hamming(a["dhash"],b["dhash"]);d2=hamming(a["ahash"],b["ahash"]);d=(d1+d2)/2
            if d<=threshold:
                pairs.append({"a":a["path"],"b":b["path"],"relation":"perceptual_candidate","distance":d,"dhash_distance":d1,"ahash_distance":d2});union(i,j)
    groups={}
    for i,r in enumerate(rec):groups.setdefault(find(i),[]).append(r["path"])
    clusters=[v for v in groups.values() if len(v)>1]
    return {"schema_version":1,"threshold":threshold,"aspect_tolerance":aspect_tolerance,
            "warning":"Perceptual clusters are review candidates, not semantic identity.",
            "images":rec,"pairs":sorted(pairs,key=lambda x:x["distance"]),"clusters":clusters}


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument("paths",nargs="+",help="Image files and/or directories")
    ap.add_argument("-o","--output")
    ap.add_argument("--threshold",type=float,default=12)
    ap.add_argument("--aspect-tolerance",type=float,default=.03)
    a=ap.parse_args(); result=scan(a.paths,a.threshold,a.aspect_tolerance); text=json.dumps(result,indent=2)
    if a.output:Path(a.output).write_text(text+"\n",encoding="utf-8")
    else:print(text)

if __name__=="__main__":main()
