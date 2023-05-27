---
layout: page
title: DFaR
permalink: /DFaR/
Nav_include: yes
---

# Data Flooding against Ransomware - DFaR

3 tecniche di flooding

## Random

Random Data Flooding

<pre><small><b>input</b>:path,minSize,maxSize
FILE_EXT ← [“.doc”,“.pdf”,“.xls”,“.jpg”,“.mp4”,..];
<b>while</b> keep Flooding <b>do</b>
    f_size ← randomInt(minSize,maxSize);
    cnt ← newByteArray(f_size);
    ext ← rndSelect(FILE_EXT);
    append(cnt,getHeader(ext));
    seed ← random64Seed();//64-bitnumber
    <b>for</b> i ← 0 to i < (capacity(cnt)/64) <b>do</b>
        seed ← seed^(seed≪13);
        seed ← seed^(seed⋙7);
        seed ← seed^(seed≪17);
        append(cnt,seed);
    <b>end</b>
    <b>if</b> capacity(cnt) > 0 <b>then</b>
        r ← newByteArray(capacity(cnt));
        r ← fillWithRandomBytes(r);
        append(cnt,r);     
    <b>end</b> 
    writeFile( rndFilePath(path,ext),cnt); 
<b>end</b>
</small></pre>

## On-The-Fly

On-the-flySnapshooting
```
input:path forfileinwalkFiles(path)do ifisFile(f)then saveOTFSnapshot(path,f, digest(readBytes(path,f))); end end
```

On-the-flyDataFlooding
```
input:path whilekeepFloodingdo forfinwalkFiles(path)do b←readBytes(path,f); ifgetOTFSnaphot(path,f)=digest(b)then copy(b,randomFilePath(path)); end end end

```


## Shadow

Shadow Snapshooting
```
input:path forfileinwalkFiles(path)do ifisFile(f)then saveShadowSnapshot(path,readBytes(f)); end end
```
Shadow Data Flooding
```
input:path whilekeepFloodingdo forcntingetShadowSnapshots(path)do writeFile(rndFilePath(path),cnt); end end
```