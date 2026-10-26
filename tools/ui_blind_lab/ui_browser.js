
'use strict';
const VERSION='0.1.0-blind-20261026';
const $=id=>document.getElementById(id);
const pairs=[[0,1],[0,2],[0,3],[1,2],[1,3],[2,3]];
let last=null;

function lex(expr){
  let a=[],i=0,s=expr.trim();
  while(i<s.length){
    if(/\s/.test(s[i])){i++;continue;}
    let m=s.slice(i).match(/^(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?/);
    if(m){a.push({k:'num',v:+m[0]});i+=m[0].length;continue;}
    m=s.slice(i).match(/^[a-zA-Z_][a-zA-Z_0-9]*/);
    if(m){a.push({k:'id',v:m[0].toLowerCase()});i+=m[0].length;continue;}
    if('+-*/^(),'.includes(s[i])){a.push({k:s[i],v:s[i]});i++;continue;}
    throw Error('Unexpected character '+s[i]+' in '+expr);
  }
  a.push({k:'end'});return a;
}
const fns={sin:Math.sin,cos:Math.cos,tan:Math.tan,sqrt:Math.sqrt,abs:Math.abs,exp:Math.exp,log:Math.log,asin:Math.asin,acos:Math.acos,atan:Math.atan,sinh:Math.sinh,cosh:Math.cosh,tanh:Math.tanh};
function compile(expr){
  const tok=lex(expr);let i=0;
  const peek=()=>tok[i],take=()=>tok[i++];
  function parse(min=0){
    let t=take(),left;
    if(t.k==='num'){let c=t.v;left=()=>c;}
    else if(t.k==='id'){
      if(t.v==='s')left=s=>s;
      else if(t.v==='pi')left=()=>Math.PI;
      else if(t.v==='e')left=()=>Math.E;
      else if(fns[t.v]){
        if(take().k!=='(')throw Error('Expected ( after '+t.v);
        const inside=parse(0);
        if(take().k!==')')throw Error('Expected ) after '+t.v);
        left=s=>fns[t.v](inside(s));
      }else throw Error('Unknown symbol '+t.v);
    }else if(t.k==='('){left=parse(0);if(take().k!==')')throw Error('Expected )');}
    else if(t.k==='+'||t.k==='-'){
      let rhs=parse(3);left=t.k==='-'?s=>-rhs(s):s=>rhs(s);
    }else throw Error('Invalid expression near '+JSON.stringify(t));
    const precedence={'+':1,'-':1,'*':2,'/':2,'^':3};
    while(precedence[peek().k]>=min && peek().k!=='end'){
      let op=take().k,pri=precedence[op];let right=parse(pri+(op==='^'?0:1));let l=left;
      if(op==='+')left=s=>l(s)+right(s);
      if(op==='-')left=s=>l(s)-right(s);
      if(op==='*')left=s=>l(s)*right(s);
      if(op==='/')left=s=>l(s)/right(s);
      if(op==='^')left=s=>Math.pow(l(s),right(s));
    }
    return left;
  }
  let fn=parse();if(peek().k!=='end')throw Error('Unexpected trailing expression '+expr);
  return s=>{let v=fn(s);if(!Number.isFinite(v))throw Error('Non-finite expression '+expr+' at s='+s.toPrecision(6));return v;};
}
const norm=v=>Math.hypot(...v);
function unit(v){let n=norm(v);if(!Number.isFinite(n)||n<=0)throw Error('Reference vector/normal must be nonzero');return v.map(x=>x/n);}
function applyRotation(vec,angles){let v=vec.slice();for(let k=0;k<6;k++){let [i,j]=pairs[k],c=Math.cos(angles[k]),sn=Math.sin(angles[k]);let a=v[i],b=v[j];v[i]=a*c-b*sn;v[j]=a*sn+b*c;}return v;}
function derivative(a,ds){let n=a.length,z=new Array(n);
  for(let i=0;i<n;i++){
    if(i===0)z[i]=(-3*a[0]+4*a[1]-a[2])/(2*ds);
    else if(i===n-1)z[i]=(3*a[n-1]-4*a[n-2]+a[n-3])/(2*ds);
    else z[i]=(a[i+1]-a[i-1])/(2*ds);
  }return z;
}
function vder(a,ds){let n=a.length,D=Array.from({length:n},()=>Array(a[0].length));for(let j=0;j<a[0].length;j++){
 let d=derivative(a.map(row=>row[j]),ds);for(let i=0;i<n;i++)D[i][j]=d[i];
}return D;}
const dot=(a,b)=>a.reduce((z,v,i)=>z+v*b[i],0);
const tr=(y,ds)=>ds*(y.reduce((sum,v,i)=>sum+((i===0||i===y.length-1)?.5:1)*v,0));
function evaluateGeometry(s,X,control){let n=s.length,ds=(s[n-1]-s[0])/(n-1);if(n<7||!Number.isFinite(ds)||ds<=0)throw Error('Need increasing s and at least seven points');
 let q=X.map(row=>norm(row));if(q.some(v=>v<=0))throw Error('Curve passes through origin: inverse direction undefined');
 let u=X.map((row,i)=>row.map(v=>v/q[i]));let v=vder(X,ds),a=vder(v,ds),qd=derivative(q,ds),ud=vder(u,ds);
 let vv=v.map(x=>dot(x,x)),aa=a.map(x=>dot(x,x)),ang=ud.map(x=>norm(x));
 let radial=qd.map((x,i)=>x*x+q[i]*q[i]*ang[i]*ang[i]);
 let split=vv.map((x,i)=>Math.abs(x-radial[i]));
 let dx=X.at(-1).map((z,j)=>z-X[0][j]);let bound=dot(dx,dx)/(2*(s.at(-1)-s[0]));
 let director=unit(control.normal),d=v.map(x=>dot(x,director));
 return {s,X,q,u,ang,vv,aa,d,normal:director,angles:control.angles||null,seed:control.seed||null,
  integrals:{I_stretch:.5*tr(vv,ds),I_bend:.5*tr(aa,ds),I_director:tr(d.map(x=>x*x),ds)},
  check:Math.max(...split.slice(2,-2)),stretch_bound:bound,points:n,
  mode:control.mode||'forward'};
}
function inputs(){let q=compile($('q').value),afs=pairs.map(([i,j])=>compile($('a'+i+j).value));
 let start=compile($('s0').value)(0),end=compile($('s1').value)(0),n=+$('n').value;
 if(!(end>start))throw Error('s end must exceed s start');
 let seed=unit(Array.from({length:4},(_,i)=>compile($('x'+i).value)(0)));
 let normal=$('normal').value.split(',').map(x=>compile(x)(0));if(normal.length!==4)throw Error('normal needs four comma-separated numbers');
 let s=Array.from({length:n},(_,i)=>start+(end-start)*i/(n-1));
 let angles=s.map(v=>afs.map(f=>f(v))),qs=s.map(v=>q(v));
 if(qs.some(v=>v<=0))throw Error('q(s) must remain strictly positive to support inverse mapping');
 let X=s.map((v,i)=>applyRotation(seed,angles[i]).map(x=>qs[i]*x));
 let d=evaluateGeometry(s,X,{normal,angles,seed,mode:'forward'});
 d.controlExpr={q:$('q').value,planes:pairs.map(([i,j])=>$('a'+i+j).value),s_start:$('s0').value,s_end:$('s1').value,n,seed,normal};
 return d;
}
function canvasCtx(canvas){let w=canvas.clientWidth||390,h=canvas.clientHeight||270,dpr=window.devicePixelRatio||1;canvas.width=Math.round(w*dpr);canvas.height=Math.round(h*dpr);let c=canvas.getContext('2d');c.setTransform(dpr,0,0,dpr,0,0);c.clearRect(0,0,w,h);return {c,w,h};}
function linePlot(canvas,series,zeroAxes=true){let {c,w,h}=canvasCtx(canvas);const all=series.flatMap(x=>x.y);let mi=Math.min(...all),ma=Math.max(...all);if(ma-mi<1e-10){mi-=1;ma+=1;}else {let pad=(ma-mi)*.14;mi-=pad;ma+=pad;}let left=42,right=15,top=21,bottom=33,ww=w-left-right,hh=h-top-bottom;
 c.strokeStyle='#23383e';c.lineWidth=1;for(let i=0;i<=4;i++){let y=top+i*hh/4;c.beginPath();c.moveTo(left,y);c.lineTo(w-right,y);c.stroke();}
 c.font='10px monospace';c.fillStyle='#8da5a8';c.textAlign='right';for(let i=0;i<=4;i++){c.fillText((ma-(ma-mi)*i/4).toPrecision(3),left-7,top+i*hh/4+3);}
 series.forEach(({y,col,label})=>{c.strokeStyle=col;c.lineWidth=1.8;c.beginPath();y.forEach((v,i)=>{let x=left+ww*i/(y.length-1),yy=top+hh*(ma-v)/(ma-mi);if(i===0)c.moveTo(x,yy);else c.lineTo(x,yy);});c.stroke();});
 let offset=left;series.forEach(({col,label})=>{c.fillStyle=col;c.fillRect(offset,h-15,9,3);c.textAlign='left';c.fillStyle='#a5b5b7';c.fillText(label,offset+14,h-10);offset+=label.length*7+30;});
}
function xyPlot(canvas,coords){let {c,w,h}=canvasCtx(canvas),cx=w/2,cy=h/2;
 let max=Math.max(1e-8,...coords.flatMap(p=>p.map(x=>Math.abs(x))));let scale=Math.min(w,h)*.4/max;
 c.strokeStyle='#2f4950';c.lineWidth=1;c.beginPath();c.moveTo(0,cy);c.lineTo(w,cy);c.moveTo(cx,0);c.lineTo(cx,h);c.stroke();
 c.strokeStyle='#86d7c6';c.lineWidth=2.2;c.beginPath();coords.forEach(([x,y],i)=>{let px=cx+x*scale,py=cy-y*scale;if(i===0)c.moveTo(px,py);else c.lineTo(px,py);});c.stroke();
 c.fillStyle='#e6cc95';let [x,y]=coords[0];c.beginPath();c.arc(cx+x*scale,cy-y*scale,4,0,Math.PI*2);c.fill();
 c.font='10px monospace';c.fillStyle='#799ba1';c.fillText('0',cx+6,cy+13);
}
function projectedPlot(canvas,X){let proj=X.map(([x,y,z,w])=>[x+.42*z+.12*w,y+.28*z-.25*w,w]);let coords=proj.map(x=>x.slice(0,2));xyPlot(canvas,coords);
 let {c,w,h}=canvasCtx(canvas);let max=Math.max(1e-8,...coords.flatMap(p=>p.map(x=>Math.abs(x))));let scale=Math.min(w,h)*.4/max;let wm=Math.max(1e-8,...proj.map(p=>Math.abs(p[2])));
 for(let i=0;i<proj.length;i+=Math.max(1,Math.floor(proj.length/90))){let [x,y,w4]=proj[i];let p=((w4/wm)+1)/2;c.fillStyle=`rgba(${Math.round(160+70*p)},${Math.round(144+60*(1-p))},170,0.55)`;c.beginPath();c.arc(w/2+x*scale,h/2-y*scale,1+2*p,0,2*Math.PI);c.fill();}
}
function show(d){let p=$('projection').value.split(',').map(Number);$('planeLabel').textContent=p.join(' / ');xyPlot($('path2d'),d.X.map(row=>[row[p[0]],row[p[1]]]));projectedPlot($('path3d'),d.X);
 linePlot($('radialChart'),[{y:d.q,col:'#86d7c6',label:'q'},{y:d.ang,col:'#dbb579',label:'|u′|'}]);
 linePlot($('actionChart'),[{y:d.vv.map(x=>x/2),col:'#81b1f0',label:'|X′|²/2'},{y:d.aa.map(x=>x/2),col:'#efae7b',label:'|X″|²/2'},{y:d.d.map(x=>x*x),col:'#c7a4eb',label:'(X′·n)²'}]);
 const fmt=v=>Math.abs(v)<1e-8?v.toExponential(2):v.toPrecision(7);
 $('certificate').textContent='Variational certificate (Cauchy–Schwarz): I_stretch ≥ |X(end)−X(start)|²/[2 Δs] = '+fmt(d.stretch_bound)+'. Excess = '+fmt(d.integrals.I_stretch-d.stretch_bound)+'. Only a geometrical lower bound; parameterization and boundary conditions matter.';
 $('I1').textContent=fmt(d.integrals.I_stretch);$('I2').textContent=fmt(d.integrals.I_bend);$('I3').textContent=fmt(d.integrals.I_director);$('err').textContent=fmt(d.check);
 $('status').classList.remove('err');$('status').textContent=`${d.mode==='inverse'?'INVERSE':'FORWARD'} MAP | ${d.points} samples | geometry computed.\nEuclidean direction and scale recovered. Full SO(4) frame remains nonunique (SO(3) gauge).\nPhysical predictions not claimed; no band-energy relation or material values loaded.`;
}
function compute(){try{last=inputs();show(last);}catch(e){$('status').classList.add('err');$('status').textContent='INPUT ERROR: '+e.message;}}
function download(name,data,mime='application/json'){let b=new Blob([data],{type:mime}),url=URL.createObjectURL(b),a=document.createElement('a');a.href=url;a.download=name;document.body.append(a);a.click();a.remove();setTimeout(()=>URL.revokeObjectURL(url),1000);}
function csv(){if(!last)throw Error('Compute a map first');let lines=['s,x0,x1,x2,x3,q'];last.s.forEach((s,i)=>lines.push([s,...last.X[i],last.q[i]].map(x=>Number(x).toPrecision(15)).join(',')));return lines.join('\n')+'\n';}
function controls(){if(!last||last.mode!=='forward')throw Error('Compute a forward control mapping first');return {s:last.s,q:last.q,angles:last.angles,x0:last.seed};}
// Deterministic SHA-256 fallback ensures local file:// pages can freeze without WebCrypto.
function sha256Bytes(bytes){
 const K=[0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2];
 let h=[0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19];
 let a=[...bytes],bits=BigInt(a.length)*8n;a.push(128);while(a.length%64!==56)a.push(0);
 for(let i=7;i>=0;i--)a.push(Number((bits>>(BigInt(i)*8n))&255n));
 const rr=(x,n)=>(x>>>n)|(x<<(32-n));
 for(let pos=0;pos<a.length;pos+=64){
  let w=new Array(64);for(let i=0;i<16;i++){let j=pos+i*4;w[i]=((a[j]<<24)|(a[j+1]<<16)|(a[j+2]<<8)|a[j+3])>>>0;}
  for(let i=16;i<64;i++){let x=w[i-15],y=w[i-2];let s0=rr(x,7)^rr(x,18)^(x>>>3),s1=rr(y,17)^rr(y,19)^(y>>>10);w[i]=(w[i-16]+s0+w[i-7]+s1)>>>0;}
  let [A,B,C,D,E,F,G,H]=h;
  for(let i=0;i<64;i++){let s1=rr(E,6)^rr(E,11)^rr(E,25),ch=(E&F)^(~E&G),t1=(H+s1+ch+K[i]+w[i])>>>0;let s0=rr(A,2)^rr(A,13)^rr(A,22),maj=(A&B)^(A&C)^(B&C),t2=(s0+maj)>>>0;
   H=G;G=F;F=E;E=(D+t1)>>>0;D=C;C=B;B=A;A=(t1+t2)>>>0;
  }let next=[A,B,C,D,E,F,G,H];h=h.map((x,i)=>(x+next[i])>>>0);
 }
 return h.map(v=>v.toString(16).padStart(8,'0')).join('');
}
async function fingerprint(obj){const bytes=new TextEncoder().encode(JSON.stringify(obj));
 if(globalThis.crypto?.subtle){try{let digest=await crypto.subtle.digest('SHA-256',bytes);return [...new Uint8Array(digest)].map(b=>b.toString(16).padStart(2,'0')).join('')}catch(e){/*local fallback*/}}
 return sha256Bytes(bytes);
}
function readCSV(raw){let lines=raw.trim().split(/\r?\n/).map(x=>x.trim()).filter(Boolean);if(lines.length<8)throw Error('Need at least seven data rows plus optional header');let parsed=lines.map(line=>line.split(/[\s,;]+/).map(Number));if(parsed[0].some(x=>!Number.isFinite(x)))parsed.shift();if(parsed.length<7||parsed.some(row=>row.length<5||row.some(x=>!Number.isFinite(x))))throw Error('Use five numerical columns s,x0,x1,x2,x3');let s=parsed.map(r=>r[0]);if(s.some((v,i)=>i>0&&v<=s[i-1]))throw Error('s must increase');let ds=(s.at(-1)-s[0])/(s.length-1);if(s.some((v,i)=>Math.abs(v-(s[0]+i*ds))>1e-6*Math.max(1,Math.abs(v))))throw Error('This version needs evenly sampled s');
 let X=parsed.map(r=>r.slice(1,5)),normal=$('normal').value.split(',').map(x=>compile(x)(0));return evaluateGeometry(s,X,{normal,mode:'inverse'});
}
$('computeBtn').addEventListener('click',compute);
$('projection').addEventListener('change',()=>{if(last)show(last)});
$('exportCurve').addEventListener('click',()=>{try{download('ui_curve_dimensionless.csv',csv(),'text/csv');}catch(e){alert(e.message)}});
$('exportControls').addEventListener('click',()=>{try{download('ui_controls_dimensionless.json',JSON.stringify(controls(),null,2)+'\n');}catch(e){alert(e.message)}});
$('freezeBtn').addEventListener('click',async()=>{try{if(!last)throw Error('Compute a map first');let frozen={build:VERSION,protocol:'SOURCE-ONLY / NO EMPIRICAL HOLDOUT ACCESS',controls:last.controlExpr||'Imported CSV: no declared generative controls',identity:'X=qR x0; |X_prime|^2=q_prime^2+q^2 |u_prime|^2',integrals:last.integrals,identity_residual_interior:last.check,stretch_lower_bound:last.stretch_bound,claims:{electronic_band_energy:'NOT_DERIVED',mobility:'NOT_DERIVED',effective_mass:'NOT_DERIVED'},sample_count:last.points};let hash=await fingerprint(frozen);download('ui_blind_freeze_'+hash.slice(0,12)+'.json',JSON.stringify({...frozen,sha256_canonical_payload:hash},null,2)+'\n');$('status').textContent+='\nBLIND SNAPSHOT SHA-256: '+hash;}catch(e){$('status').classList.add('err');$('status').textContent='FREEZE ERROR: '+e.message;}});
$('resetBtn').addEventListener('click',()=>{const init={q:'1',a01:'s',a02:'0',a03:'0',a12:'0',a13:'0',a23:'0',x0:'1',x1:'0',x2:'0',x3:'0',s0:'0',s1:'2*pi',normal:'0,0,0,1'};Object.entries(init).forEach(([id,v])=>$(id).value=v);$('projection').value='0,1';$('n').value='401';compute()});
$('invertBtn').addEventListener('click',async()=>{try{let file=$('csvFile').files[0];if(!file)throw Error('Choose a CSV');last=readCSV(await file.text());show(last);$('inverseState').textContent='Recovered q and u; full frame has 3 unconstrained rotations per sample.';}catch(e){$('inverseState').textContent='Import error: '+e.message;}});
window.addEventListener('resize',()=>{if(last)show(last)});
window.SAT_UI_BLIND={compile,applyRotation,evaluateGeometry,sha256Bytes,get result(){return last;},version:VERSION};
compute();