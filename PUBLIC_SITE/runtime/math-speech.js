// Glass Sausage Factory — deterministic math-to-speech normalizer.
// Goal: speak mathematical meaning rather than raw Markdown/LaTeX delimiters.

const GREEK = {
  alpha:'alpha',beta:'beta',gamma:'gamma',delta:'delta',epsilon:'epsilon',theta:'theta',
  kappa:'kappa',lambda:'lambda',mu:'mu',nu:'nu',xi:'xi',pi:'pi',rho:'rho',sigma:'sigma',
  tau:'tau',phi:'phi',chi:'chi',psi:'psi',omega:'omega',
  Gamma:'capital gamma',Delta:'capital delta',Theta:'capital theta',Lambda:'capital lambda',
  Xi:'capital xi',Pi:'capital pi',Sigma:'capital sigma',Phi:'capital phi',Psi:'capital psi',Omega:'capital omega'
};

function bracedCommand(input, command, render) {
  let s=input, pos=0, needle=`\\${command}{`;
  while ((pos=s.indexOf(needle,pos))>=0) {
    const open=pos+needle.length-1; let depth=0,end=-1;
    for(let i=open;i<s.length;i++){ if(s[i]==='{')depth++; else if(s[i]==='}'&&--depth===0){end=i;break;} }
    if(end<0)break;
    const rep=render(s.slice(open+1,end));
    s=s.slice(0,pos)+rep+s.slice(end+1); pos+=rep.length;
  }
  return s;
}

function fractions(input){
  let s=input,pos=0,needle='\\frac{';
  while((pos=s.indexOf(needle,pos))>=0){
    const a0=pos+needle.length-1; let d=0,a1=-1;
    for(let i=a0;i<s.length;i++){if(s[i]==='{')d++;else if(s[i]==='}'&&--d===0){a1=i;break;}}
    if(a1<0||s[a1+1]!=='{'){pos+=needle.length;continue;}
    const b0=a1+1; d=0; let b1=-1;
    for(let i=b0;i<s.length;i++){if(s[i]==='{')d++;else if(s[i]==='}'&&--d===0){b1=i;break;}}
    if(b1<0)break;
    const rep=` ( ${s.slice(a0+1,a1)} ) over ( ${s.slice(b0+1,b1)} ) `;
    s=s.slice(0,pos)+rep+s.slice(b1+1); pos+=rep.length;
  }
  return s;
}

function superscript(x){
  x=x.trim(); if(x==='2')return ' squared '; if(x==='3')return ' cubed ';
  if(x==='-1')return ' inverse '; if(x==='-2')return ' to the minus two ';
  if(x==='T')return ' transpose '; return ` to the power ${x} `;
}

export function verbalizeLatex(latex,{mode='scientist'}={}){
  if(mode==='skip')return 'displayed equation';
  let s=String(latex||'').trim().replace(/^\$\$|\$\$$/g,'').replace(/^\\\[|\\\]$/g,'').trim();
  if(!s)return '';
  if(mode==='literal') return s.replace(/\\/g,' backslash ').replace(/\{/g,' open brace ').replace(/\}/g,' close brace ').replace(/_/g,' subscript ').replace(/\^/g,' superscript ').replace(/\$/g,' dollar ').replace(/\s+/g,' ').trim();

  s=fractions(s);
  s=bracedCommand(s,'sqrt',x=>` square root of ( ${x} ) `);
  for(const cmd of ['text','mathrm','mathbf','mathcal','operatorname']) s=bracedCommand(s,cmd,x=>` ${x} `);
  s=s.replace(/\\int_\{([^{}]+)\}\^\{([^{}]+)\}/g,' integral from $1 to $2 ')
     .replace(/\\sum_\{([^{}]+)\}\^\{([^{}]+)\}/g,' sum from $1 to $2 ');
  for(const [k,v] of Object.entries(GREEK)) s=s.replace(new RegExp(`\\\\${k}\\b`,'g'),` ${v} `);
  const commands={int:' integral ',sum:' sum ',prod:' product ',cdot:' times ',times:' times ',pm:' plus or minus ',approx:' approximately ',sim:' scales like ',propto:' is proportional to ',equiv:' is equivalent to ',neq:' is not equal to ',leq:' is less than or equal to ',geq:' is greater than or equal to ',in:' in ',to:' to ',rightarrow:' goes to ',leftrightarrow:' corresponds to ',infinity:' infinity ',partial:' partial ',nabla:' nabla ',sin:' sine ',cos:' cosine ',tan:' tangent ',log:' log ',ln:' natural log ',exp:' exponential ',det:' determinant ',tr:' trace '};
  for(const [k,v] of Object.entries(commands)) s=s.replace(new RegExp(`\\\\${k}\\b`,'g'),v);
  s=s.replace(/\\left|\\right/g,'').replace(/\\,|\\;|\\!|\\quad|\\qquad/g,' ')
     .replace(/_\{([^{}]+)\}/g,(_,x)=>` sub ${x} `).replace(/\^\{([^{}]+)\}/g,(_,x)=>superscript(x))
     .replace(/_([A-Za-z0-9]+)/g,(_,x)=>` sub ${x} `).replace(/\^(-?\d+|[A-Za-z*]+)/g,(_,x)=>superscript(x));
  const unicode={'λ':'lambda','μ':'mu','π':'pi','ρ':'rho','χ':'chi','Ω':'capital omega','ω':'omega','θ':'theta','φ':'phi','ψ':'psi','ξ':'xi'};
  for(const [k,v] of Object.entries(unicode))s=s.split(k).join(` ${v} `);
  s=s.replace(/ᚼ/g,' Hagalaz ').replace(/H\(s\)H/g,' H S H ').replace(/\bSO\s*\(\s*4\s*\)/gi,' special orthogonal group in four dimensions ').replace(/\bSim\s*\(\s*4\s*\)/gi,' similarity group in four dimensions ')
     .replace(/'/g,' prime ').replace(/=/g,' equals ').replace(/\+/g,' plus ').replace(/→|⇒/g,' goes to ').replace(/↔|⇔/g,' corresponds to ').replace(/≈/g,' approximately equals ').replace(/≠/g,' is not equal to ').replace(/≤/g,' is less than or equal to ').replace(/≥/g,' is greater than or equal to ').replace(/∞/g,' infinity ').replace(/√/g,' square root of ').replace(/∂/g,' partial ').replace(/∇²/g,' Laplacian ').replace(/∇/g,' nabla ').replace(/∫/g,' integral ').replace(/∑/g,' sum ').replace(/×|·/g,' times ')
     .replace(/[{}]/g,' ').replace(/\\([A-Za-z]+)/g,' $1 ').replace(/[_^$|]/g,' ').replace(/\s+/g,' ').trim();
  return s||'equation';
}

export function normalizeMathForSpeech(text,{mode='scientist'}={}){
  let s=String(text||'').replace(/```[\s\S]*?```/g,' Code block omitted. ');
  s=s.replace(/\$\$([\s\S]*?)\$\$/g,(_,m)=>` ${verbalizeLatex(m,{mode})}. `)
     .replace(/\\\[([\s\S]*?)\\\]/g,(_,m)=>` ${verbalizeLatex(m,{mode})}. `)
     .replace(/\$([^$\n]+)\$/g,(_,m)=>` ${verbalizeLatex(m,{mode})} `)
     .replace(/\\\(([^\n]*?)\\\)/g,(_,m)=>` ${verbalizeLatex(m,{mode})} `)
     .replace(/`([^`]+)`/g,'$1').replace(/https?:\/\/\S+/g,' link ')
     .replace(/\*\*([^*]+)\*\*/g,'$1').replace(/^#{1,6}\s+/gm,'').replace(/^[-*+]\s+/gm,'').replace(/^>\s?/gm,'').replace(/\s+/g,' ').trim();
  return s;
}
