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
In the <a href="#results">figure below</a> we report prelimiary test results of using Ranflood to contrats real-world crypto-ransmoware. For each piece of ransomware, we consider different activation times (e.g., 30s, 60s, etc.), reported along the execution of the ransomware without Ranflood. We report the results as the percentage of files lost, saved, and copied for each attack scenario. 

Since Ranflood provides different contrast/flooding modalities, we run all of them for each ransomware-trigger-time pair. We lay the obtained data out in the figure by reporting on the abscissa the Ranflood flooding modalities (Random, On-The-Fly, and Shadow), while the ordinates show the performance of the crypto-ransomware w.r.t. the different trigger delays (30s, 60s, etc.). 

The cells in the figure are composed as follows: the central area shows the percentage of valid (non-encrypted) files. Since copy-based flooding strategies allow the restoration of lost original files, we break the percentage of valid files down to a blue one (original) and green one (restored), reporting the related percentages respectively at the bottom and at the top of the bar. The red part completes the picture, representing the percentage of lost files.

In the first row, the various scenarios are identical as the crypto ransomware samples did not work in the folders that we consider sensitive for the user (GandCrab - GC, Ryuk, and Vipasana).

As can be seen from the figure, Ranflood's performance depends on the type of crypto-ransomware it is targeting. 
In particular, LockBit encrypts files following a strategy where the malware quickly skims through the folders of the user, only encrypting the first 4KB of each file. This behaviour, in unison with the relatively late activation of Ranflood (which in our tests is set to start, at the earliest, 30 seconds after the activation of the ransomware) makes LockBit the toughest among the opponents. The only effective strategy with which Ranflood manages to counter Lockbit is by using the *Shadow*, reaching the threshold of 48% of recovered files.

Phobos completely encrypts all data if not countered by Ranflood, while even with only the *Random* strategy it is possible to save up to 14% of the data. With the more complex strategies (*On-The-Fly* and *Shadow*) up to 29% of the data can be recovered.

WannaCry behaves like LockBit, but it is less aggressive, leaving more than half of the user's file untouched when left free to roam. Similarly to Phobos, we notice that we hit the "sweet spot" for the activation delay when it matches with some internal delay of the malware. The effectiveness of the *Random* modality peaks at 73% saved files when activated with a 180-second delay, *On-The-Fly* peaks at 67% saved files when activated with a 60-second delay, and *Shadow* reaches 94% at its earliest activation time.

  <div class="col-8 offset-2 pt-3 pb-1 text-center alert alert-success">
    <p class="text-center" markdown="1">
  It is important to note that Ranflood's activation delay directly affects the amount of recoverable files, the shorter the time between activating the crypto-ransmoware and Ranflood, the greater the number of saved-recovered files.
  In all cases, we look at the worst-case scenarios of late activations of Ranflood, given that the minimum intervention delay is 30 seconds; in reality, existing crypto-ransomware detection software take much less time to detect an ongoing attack. 
  </p>
  </div>


</div>



<hr class="my-5">

</div>
<figure>
  <img id="results" class="mx-auto d-block img-fluid" src="/assets/img/results.jpg">
  <figcaption>
    <p>Results of the aggregated tests, loss-rate percentage&mdash;each cell shows the percentage of valid (non-encrypted) files. For  copy-based strategies we breakdown the percentage of valid files into a blue one (original) and a green one (restored), reporting the related percentages respectively at the bottom and at the top of the bar. The longer the blue/green bar, the better.</p>
  </figcaption>
</figure>


<hr class="my-5">
<div class="col-8 offset-2 pt-3 pb-1 text-center alert alert-info">
  <p class="text-center" markdown="1">The complete set of data gathered from our experiments is available at [https://doi.org/10.5281/zenodo.6587519](https://doi.org/10.5281/zenodo.6587519)</p>
</div>
</section>
