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

<pre><small><b>input</b>:path
<b>for</b> fileinwalkFiles(path) <b>do</b>
    <b>if</b> isFile(f) <b>then</b>
        saveOTFSnapshot(path,f,digest(readBytes(path,f)));
    <b>end</b>
<b>end</b>
</small></pre>

On-the-flyDataFlooding

<pre><small><b>input</b>:path
<b>while</b> keepFlooding <b>do</b>
    <b>for</b> f in walkFiles(path) <b>do</b>
        b ← readBytes(path,f);
        <b>if</b> getOTFSnaphot(path,f)=digest(b)<b>then</b>
            copy(b,randomFilePath(path));
        <b>end</b>
    <b>end</b>
<b>end</b>
</small></pre>


## Shadow

Shadow Snapshooting

<pre><small><b>input</b>:path
<b>for</b> fileinwalkFiles(path) <b>do</b>
    <b>if</b> isFile(f) <b>then</b>
        saveShadowSnapshot(path,readBytes(f));
    <b>end</b>
<b>end</b>

</small></pre>
Shadow Data Flooding

<pre><small><b>input</b>:path
<b>while</b> keepFlooding <b>do </b>
    <b>for</b> cnt in getShadowSnapshots(path) <b>do</b>
        writeFile(rndFilePath(path),cnt);
    <b>end</b>
<b>end</b>
</small></pre>



