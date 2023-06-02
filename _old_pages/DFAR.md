---
layout: page
title: DFaR
permalink: /DFaR/
Nav_include: yes
---

# Data Flooding against Ransomware - DFaR

Before presenting relevant details of Ranflood, we introduce the family of techniques, called Data Flooding against
Ransomware (DFaR), where Ranflood comes from—hinged
on the dynamic honeypot approach. We start by positioning
DFaR against the existing work on honeypots used to contrast ransomware. Then, we discuss how DFaR represents
a family of techniques which includes applications to three
main areas of vulnerability management: detection, mitigation, and restoration.

## Dynamic Honeypots and Data Flooding against Ransomware


The essence of honeypots relies on the renowned scheme
where administrators deploy easy-to-access computer resources that emulate the real ones present within the same network. These dummy resources must look as indistinguishable from the actual ones as possible to an external intruder.
Administrators isolate these resources from the real system
to detect and slow down intrusions, setting up monitors to
notify any suspicious activity (which is illicit by definition,
since there is no reason for legitimate users to access the
honeypot).
Previous works analysed the use of honeypots to detect
ransomware (Moore, 2016; Al-rimy et al., 2018; Kok et al.,
2019). The simplest declination of this approach lies in deploying one or more honeypot nodes that contain data profiles similar to the ones attacked by ransomware. Then, monitors on the honeypot nodes can detect any changes to these
static, isolated files and warn the administrators of the presence of malware in the network.
More advanced techniques rely on using honeypots directly on the real nodes. The core of these solutions is to create honeypot folders and monitor them for changes. While
the idea seems promising—essentially, making any node of
the network a possible honeypot monitor for ransomware—
the analysis performed by Moore (2016) on the existing techniques revealed a strong limitation to the approach. The
problem, here, is that these solutions rely on static files always present on the disk of the user. Since the honeypot files
can mix with the actual ones of the user, a solution that implements this technique must balance between its available
trapping surface and the encumbrance it causes to the users.
In essence, if one wanted to have complete monitoring of a
whole machine, there should be at least one honeypot file
in each of its folders. However, this quickly becomes inconvenient when mixing honeypot files with users’ data. Indeed, users create, move, and delete folders in their ordinary
work routines and they could trip the alarm of the detector.
One could think of excluding these frequently used folders,
but it would be a strong limitation of the range of the detector, since most ransomware attacks those locations (Rossow
et al., 2012; Y. Connolly and Wall, 2019; Continella et al.,
2016) which hold content sensitive to the user. Hence, honeypot solutions resort to using seldom-browsed (and attacked)
locations and folders, thus limiting their trapping surface and
strongly restraining their detecting ability: in the words of
Moore (2016) “there is no way to influence the malware to
access the area containing the monitored files”.
The idea behind Data Flooding against Ransoware develops this take on ubiquitous honeypots against ransomware
and gives it a Muhammad-and-the-Montain kind of twist:

***if the ransomware will not come to the trap,
then the trap must go to the ransomware***

Instead of using static files and incurring in the related
trap-surface limitations, our intuition is to adopt a dynamic
approach, where detection works by monitoring the activity of processes and by generating “floods” of honeypot files. If
the process under inspection modifies the honeypot files—
refined instantiations can analyse the patterns of data transformation to minimise false positives—we have strong evidence that it is some malware trying to lock the files of the
user.
Working on the above idea, we found that one can use
data flooding not only to detect ransomware, but also to contrast their action by mitigating their attacks and recovering
from these.
The essence of the approach behind Data Flooding against
Ransomware (DFaR) is to generate a deluge of honeypot files
on demand in sensible locations, such as where the ransomware is executing or user folders, to detect and contrast the attacks. DFaR detection overcomes the limitations of existing
honeypot solutions by adopting a dynamic stance towards
decoy file deployment and their monitoring. DFaR mitigation (i.e., the contrast of an ongoing attack) has two benefits.
On the one hand, it generates resource contention (Hunger
et al., 2015) with the ransomware: its I/O operations compete on accessing the disk against the many ones induced by
the flooder, slowing down the action of the former; on the
other hand, data flooding performs a moving target defence
action (Evans et al., 2011): the legit files of the users mix
with the many decoy ones generated by the flooder, leading
the ransomware to spend time (and I/O access) harmlessly
working on honeypot files rather than on the sensitive ones.
Recovery in DFaR can happen when mitigation used flooding techniques that generate files as copies of existing files
of the user. Here, the idea is that, even if the ransomware
encrypts the original copies of the user, we can recover the
missing files using their pristine copies (if any).

![scenario Ranflood](/images/scenari.jpg)

To aid our presentation, we depict in Figure 2 a scheme
of the action of some representative ransomware (top) and its
interaction with a DFaR-based mitigation tool (bottom)—in
the picture, we represent this tool with the Ranflood logo ![Ranflood logo](/images/favicon/favicon-16x16.png) .
In the top part of the Figure, at time 𝑡0
(the left-most
block on the line), the ransomware starts its attack on a target
folder by encrypting the files therein (the green documents
represent the authentic files of the user). At time 𝑡1
, the ransomware has encrypted some files (viz., the red icons with
a lock badge) and continues its action on the next ones. At
time 𝑡𝑛
, the ransomware has terminated the attack, and encrypted all files.
At the bottom of Figure 2, we show how a DFaR-based
tool—specifically, Ranflood—contrasts the action above. In
the Figure, the tool appears only after some detection mechanism activated it (as discussed in Section 3.2.2), at 𝑡1
.
The detection phase can instruct the tool to act on a specific set of folders, where the ransomware is performing its
attack. However, this mitigation technique can also work
under the weaker assumption that the detector found an ongoing attack, without indicating where this is happening,
but the user specified sensitive folders to defend against the
ransomware (e.g., the “Home” folder, “Documents”, etc.),
which the tool floods with files. We respectively call these
activity- and location-based activation modalities, and we
deem both of them valid.
Of course, the activity-based modality is the most focussed of the two, as it contrasts the action of the ransomware in the location where it is deploying its attack. When
one cannot rely on a detector able to spot where the ransomware is acting, the location-based mode provides a way to
(preemptively) ward sensitive folders. Concretely, we also
use the location-based modality in Section 5 to simplify the
evaluation process of Ranflood, since it is not affected by
the possible flakiness of activity-based flooding—which can
change the target location of the countermeasure over different runs.
In general, one can even decide to deploy both activityand location-based countermeasures to increase the effectiveness of the mitigation. The conjecture, here, is that the mix would simultaneously contrast the attack of the ransomware where it is causing damage, and flooding the critical
folders to the user in advance. Since this is an advanced composition of those modalities, we leave the empirical study of the effectiveness of their combination as future work.
Back to Figure 2, upon activation, the mitigation tool generates honeypot files (the documents marked with the
“R” badge). The assumption we make is that, by generating
a number of copies significantly greater than the number of
legit files, the ransomware will more likely spend time on the
former than on the latter. The ongoing action at 𝑡𝑛
represents
the mitigation effect of the tool, which hinders the attack of
the ransomware and buys time for the users/administrators
to intervene.

---  

## Three Data Flooding Strategies
To streamline the presentation of the three flooding strategies we designed and implemented in Ranflood, we delineate these via simplified pseudocode, useful to pinpoint their qualitative differences, pros, and cons. We provide more details on their actual, more sophisticated implementation in Section 4.2

### Random

***Nomen omen***, the Random flooding strategy, sketched in
Algorithm 1, floods a given location (𝑝𝑎𝑡ℎ, in the pseudocode) with randomly-generated files. It incarnates the basic form of flood-based mitigation: slowing down the ransomware via resource contention and moving-target defence.
<br>
The strategy has the smallest friction to its deployment among the three we are presenting, as it does not entail pre-flooding configurations by the user (as discussed for the ***On-The-Fly*** and the ***Shadow*** strategies, below).

<pre><small><p class="text-center"><b>Algorithm 1:</b> Random Data Flooding </p>
<b>input</b>:path,minSize,maxSize
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




### On-The-Fly

The On-The-Fly flooding strategy is the first we present that performs a copy-based flooding. Essentially, we replace the generation of synthetic files performed by the Random strategy with the generation of copies of actual files found at a flooding location. File replication adds a layer of defence to the Random strategy, as it helps to increase the likelihood of preserving the users’ files by generating additional, valid copies that might escape the ransomware.
<br>
Not all files have equal importance for this strategy. The basic rule we introduce, here, is skipping the replication of encrypted files, since they worsen the performance of the strategy; copying these files is detrimental in two ways: 
a) itwastes the time of the flooder on files useless to the user and 
b) it generates files that the malware would skip, recognising them as already encrypted.
<br>
The solution we develop to tackle this issue is to add a preliminary “snapshooting phase” to save a list of the valid files, later used during flooding for efficient discrimination.
Saving such a list trades a small occupation footprint on the disk with an increase in the efficacy of the flooding.
<br>
Specifically, the snapshooting procedure reported in Algorithm 2 saves a digest (e.g., MD5) of the content of the user files and uses it as an integrity verification code to validate the files during the flooding phase (Algorithm 3).
<br>
For simplicity, in Algorithm 3, at each iteration we read (readBytes) the files from disk and write (copy) them, if valid.

<pre><small><p class="text-center"><b>Algorithm 2</b> On-the-fly Snapshooting</p>
<b>input</b>:path
<b>for</b> fileinwalkFiles(path) <b>do</b>
    <b>if</b> isFile(f) <b>then</b>
        saveOTFSnapshot(path,f,digest(readBytes(path,f)));
    <b>end</b>
<b>end</b>
</small></pre>




<pre><small><p class="text-center"><b>Algorithm 3</b> On-the-fly Data Flooding</p>
<b>input</b>:path
<b>while</b> keepFlooding <b>do</b>
    <b>for</b> f in walkFiles(path) <b>do</b>
        b ← readBytes(path,f);
        <b>if</b> getOTFSnaphot(path,f)=digest(b)<b>then</b>
            copy(b,randomFilePath(path));
        <b>end</b>
    <b>end</b>
<b>end</b>
</small></pre>


### Shadow

The Shadow strategy is a variant of the On-The-Fly one (indeed, Algorithms 4 and 5 of Shadow are close to, respectively, Algorithms 2 and 3 of On-The-Fly), where snapshots save the full content of the files of the user rather than more lightweight information, such as their fingerprint.
<br>
Since the Shadow snapshooting phase follows the traditional process of backup systems, it also suffers the same, known trade-offs of local, on-site, and remote backup storage/retrieval.

<pre><small><p class="text-center"><b>Algorithm 4</b> Shadow Snapshooting</p>
<b>input</b>:path
<b>for</b> fileinwalkFiles(path) <b>do</b>
    <b>if</b> isFile(f) <b>then</b>
        saveShadowSnapshot(path,readBytes(f));
    <b>end</b>
<b>end</b>

</small></pre>

Shadow Data Flooding

<pre><small><p class="text-center"><b>Algorithm 5</b> Shadow Data Flooding</p>
<b>input</b>:path
<b>while</b> keepFlooding <b>do </b>
    <b>for</b> cnt in getShadowSnapshots(path) <b>do</b>
        writeFile(rndFilePath(path),cnt);
    <b>end</b>
<b>end</b>
</small></pre>




