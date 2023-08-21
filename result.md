---
layout: default
title: Result
---

<div class="container">

<div class="section-title">
  <h2>Ranflood performance discussion</h2>
  <p>Results and Analysis</p>
</div>

<section>

<div class="row content">


<div class="row content" markdown="1">
In the following figure we have reported the test results as percentages of files lost, saved and copied in each attack scenario. 

On the abscissa there are the modalities of [DFaR](/concept.html) with which Ranflood can operate, while on the ordinates there are the crypto-ransomware examined according to the various intervention delays of Ranflood. 

The cells in figure are composed as follows: thec entral area shows the percentage of valid (non-encrypted) files. Since copy-based flooding strategies allow the restoration of lost original files, we breakdown the percentage of valid files into a blue one (original) and green one (restored), reporting the related percentages respectively at the bottom and at the top of the bar. The red part completes the picture, representing the percentage slost.

In the first row the various scenarios are identical as the crypto ransomware samples did not work in the folders that we consider sensitive for the user (GandCrab - GC, Ryuk, and Vipasana).

As can be seen from the figure, Ranflood's performance depends on the type of crypto-ransomware it is targeting. 
Particulary, LockBit encrypts filesfollowing a strategy where the malware quickly skims through the folders of the user, only encrypting the first 4KB of each file. This behaviour, in unison with the relatively slow response of Ranflood (which in our tests is set to start, at the earliest, 30 seconds after the activation of the ransomware)makes LockBit the toughest among the opponents. The only effective strategy with which Ranflood manages to counter Lockbit is by using the *Shadow*, reaching the threshold of 48% of recovered files.

Phobos completely encrypts all data if not countered by Ranflood, while even with only the *Random* strategy it is possible to save up to 14% of the data. With the more complex strategies (*On-The-Fly* and *Shadow*) up to 29% of the data can be recovered.

WannaCry behaves like LockBit, but it is les saggressive, leaving more than half of the user’s file sun touched when left free to roam. Similarly to Phobos,we notice that we hit the “sweet spot” for the activation delay when it matches with some internal delay of the malware. The effectiveness of the *Random* modality peaks at 73% saved files when activated with a 180-second delay, *On-The-Fly* peaks at 67% saved files when activated with a 60-second delay, and *Shadow* reaches 94% at its earliest activation time.

  <div class="col-8 offset-2 pt-3 pb-1 text-center alert alert-success">
    <p class="text-center" markdown="1">
  It is important to note that Ranflood's activation delay directly affects the amount of recoverable files, the shorter the time between activating the crypto-ransmoware and Ranflood, the greater the number of saved-recovered files.
  In any case Ranflood always starts "disadvantaged" in our tests, given that the minimum intervention delay is 30 seconds, when a crypto-ransomware detection software could take much less time to activate Ranflood. 
  
  For this reason we believe that the results obtained are very interesting and that Ranflood is a valid system against crypto-ransomware.
  </p>
  </div>


</div>



<hr class="my-5">

</div>
<figure>
  <img class="mx-auto d-block img-fluid" src="/assets/img/results.jpg">
  <figcaption>
    <p>Results of the aggregated tests, loss-rate percentage—each cell shows the percentage of valid (non-encrypted) files. For  copy-based strategies we breakdown the percentage of valid files into a blue one (original) and a green one (restored), reporting the related percentages respectively at the bottom and at the top of the bar.The longer the blue/green bar, the better.</p>
  </figcaption>
</figure>


<hr class="my-5">
<div class="col-8 offset-2 pt-3 pb-1 text-center alert alert-info">
  <p class="text-center" markdown="1">The complete set of data gathered from our experiments is available at [https://doi.org/10.5281/zenodo.6587519](https://doi.org/10.5281/zenodo.6587519)</p>
</div>
</section>
