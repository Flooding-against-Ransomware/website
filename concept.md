---
layout: default
title: Data Flooding Against Ransomware
---

<div class="container">

<div class="section-title">
  <h2>The theory behind Ranflood</h2>
  <p>Data Flooding against Ransomware</p>
</div>

<div class="row content" markdown="1">

Ranflood is part of a family of techniques, called **Data Flooding against
Ransomware**, hinged on the *dynamic honeypot* approach and applicable to a
wide spectrum of vulnerability management concern: detection, mitigation, and
restoration.

</div>

<div class="row content" markdown="1">

#### What is a honeypot?

Essentially, honeypots rely on the renowned scheme where administrators deploy
easy-to-access computer resources that emulate the real ones present within the
same network. These dummy resources must look as indistinguishable from the
actual ones as possible to an external intruder. Administrators isolate these
resources from the real system to detect and slow down intrusions, setting up
monitors to notify any suspicious activity (which is illicit by definition,
since there is no reason for legitimate users to access the honeypot). 

The simplest declination of this approach lies in deploying one or more honeypot
nodes that contain data profiles similar to the ones attacked by ransomware.
Then, monitors on the honeypot nodes can detect any changes to these static,
isolated files and warn the administrators of the presence of malware in the
network. More advanced techniques rely on using honeypots directly on the real
nodes. The core of these solutions is to create honeypot folders and monitor
them for changes. While the idea seems promising---basically making any node of
the network a possible honeypot monitor for ransomware---in practice the
existing techniques revealed strong limitations. 

The main problem, here, is that these solutions rely on static files always
present on the disk of the user. Since the honeypot files can mix with the
actual ones of the user, a solution that implements this technique must balance
between its available trapping surface and the encumbrance it causes to the
users. In essence, if one wanted to have complete monitoring of a whole machine,
there should be at least one honeypot file in each of its folders. However, this
quickly becomes inconvenient when mixing honeypot files with users' data.
Indeed, users create, move, and delete folders in their ordinary work routines
and they could trip the alarm of the detector. One could think of excluding
these frequently used folders, but it would be a strong limitation of the range
of the detector, since most ransomware attacks those locations which hold
content sensitive to the user. Hence, honeypot solutions resort to using
seldom-browsed (and attacked) locations and folders, thus limiting their
trapping surface and strongly restraining their detecting ability. 

</div>

<div class="row content" markdown="1">

#### Dynamic Honeypots

The idea behind *Data Flooding against Ransomware* develops this take on ubiquitous
honeypots against ransomware and gives it a Muhammad-and-the-Montain kind of
twist:

<div class="col-8 offset-2 pt-3 pb-1 text-center alert alert-info" markdown="1">

*if the ransomware will not come to the trap, then the trap must go to the
ransomware*

</div>

Instead of using static files and incurring in the related trap-surface
limitations, our intuition is to adopt a dynamic approach, where detection works
by monitoring the activity of processes and by generating "floods" of honeypot
files. 

If the process under inspection modifies the honeypot files---refined
instantiations can analyse the patterns of data transformation to minimise false
positives---we have strong evidence that it is some malware trying to lock the
files of the user. 

Working on the above idea, we found that one can use data flooding not only to
detect ransomware, but also to contrast their action by mitigating their attacks
and recovering from these. 

<div class="col-10 offset-1 alert alert-success" markdown="1">

The essence of the approach behind *Data Flooding against Ransomware* (DFaR) is
to generate a deluge of honeypot files on demand in sensible locations, such as
where the ransomware is executing or user folders, to detect and contrast the
attacks. 

DFaR detection overcomes the limitations of existing honeypot solutions by
adopting a dynamic stance towards decoy file deployment and their monitoring.
DFaR mitigation (i.e., the contrast of an ongoing attack) has two benefits. 

On
the one hand, it **generates resource contention** with the ransomware: its I/O
operations compete on accessing the disk against the many ones induced by the
flooder, slowing down the action of the former. 

On the other hand, data flooding performs a **moving target defence action**:
the legit files of the users mix with the many decoy ones generated by the
flooder, leading the ransomware to spend time (and I/O access) harmlessly
working on honeypot files rather than on the sensitive ones. 

**Recovery** in DFaR can happen when mitigation used flooding techniques that
**generate files as copies of existing files of the user**. Here, the idea is that,
even if the ransomware encrypts the original copies of the user, we can recover
the missing files using their pristine copies (if any).
</div>

</div>

<div class="row content" markdown="1">

#### Visualising how DFaR Solutions Work (the Ranflood Case)

  <img class="mx-auto d-block img-fluid" src="/images/scenarii.jpg">

We use the case of how Ranflood works to illustrate the principles behind DFaR.
Above, we have a picture that depicts the action of some
representative ransomware (top) and its interaction with a DFaR-based
mitigation tool (bottom)---in the picture, we represent this tool with the
Ranflood logo ![Ranflood logo](/images/favicon/favicon-16x16.png). 

In the top part of the figure, at time t<sub>0</sub> (the left-most block on the
line), the ransomware starts its attack on a target folder by encrypting the
files therein (the green documents represent the authentic files of the user).
At time t<sub>1</sub>, the ransomware has encrypted some files (viz., the red
icons with a lock badge) and continues its action on the next ones. At time
t<sub>n</sub>, the ransomware has terminated the attack, and encrypted all
files. 

At the bottom of the figure, we show how a DFaR-based tool---specifically,
Ranflood---contrasts the action of the ransomware. In particular, notice that,
in the figure, the tool appears only after some detection mechanism activated
it, at t<sub>1</sub>. 

The detection phase can instruct the tool to act on a specific set of folders,
where the ransomware is performing its attack. However, this mitigation
technique can also work under the weaker assumption that the detector found an
ongoing attack, without indicating where this is happening, but the user
specified sensitive folders to defend against the ransomware (e.g., the "Home"
folder, "Documents", etc.), which the tool floods with files. In general, one
can even decide to deploy both activity and location-based countermeasures to
increase the effectiveness of the mitigation---the conjecture, here, is that the
mix would simultaneously contrast the attack of the ransomware where it is
causing damage, and flooding the critical folders to the user in advance. 

Back the figure, upon activation, the mitigation tool generates honeypot files
(the documents marked with the "R" badge). The insight is that, by generating a
number of copies significantly greater than the number of genuine files of the
user, the ransomware will more likely spend time on the former than on the
latter. The ongoing action at t<sub>1</sub> represents the mitigation effect of
the tool, which hinders the attack of the ransomware and buys time for the
users/administrators to intervene.

</div>