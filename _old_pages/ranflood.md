---
layout: page
title: Ranflood
permalink: /ranflood/
Nav_include: yes
---

# Ranflood - Open source software

![Flowchart](/images/flowchart.png)


## Detection
Detection schemes aim to identify ransomware attacks by monitoring specific activities.

## Mitigation
Mitigation schemes strive to contrast the effects of ransomware attacks.
Works in this category frequently adopt some declination of the moving target technique (also part of the Data
Flooding against Ransomware mitigation mechanism), e.g., “masking” user files, so that the ransomware skips them during the attack.
Ranflood implement a moving target strategy. In addition to the latter, Ranflood deploys a resource contention countermeasure that further mitigates the action of the malware.

<a class="btn btn-primary text-white" href="/DFAR/" role="button">Data Flooding against Ransomware</a>

## Restoration
Restoration schemes concentrate on recovery the encrypted data after attacks.
Ranflood, through its copy-based strategies ([OnThe-Fly and Shadow](/DFaR/)), provides a kind of recovery feature: if the original files are lost to the attack, the user has some chance to retrieve their content in the copies.
One can refine this technique, e.g., by using the Shadow archive (if any) to restore files lost after the attack and by unifying replicas and offering post-attack file-recovery support.

---
![Logo Github](/images/github.svg)
[github.com/Flooding-against-Ransomware](https://github.com/Flooding-against-Ransomware)