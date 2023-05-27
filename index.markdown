---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
---

![Logo Ranflood](/images/ranfloodLogo.png)

## RanFlood - sito in costruzione

### Intro

In recent times, the ransomware phenomenon has reached an unprecedented diffusion and unfortunately we all know at least one victim of this vile extorsion. Ransmware commonly works by encrypting user files and then asking for money to unlock them. To counteract this encryption phase, we have created a sort of **dynamic honeypot** called ***RanFlood***. Ranflood essentially floods the targeted folder with decoy files, thereby distracting and occupying the encrypting malicious action of the ransomware in order to buy valuable time for users to take action.
We call this dynamic honeypot technique *Data Flooding against Ransomware*.

### DFaR - Data Flooding against Ransomware

Data Flooding against Ransomware, tackling the main phases of detection, mitigation, and restoration, based on a mix of honeypots, resource contention, and moving target defence. These solutions hinge on detecting and contrasting the action of ransomware by flooding specific locations (e.g., the attack location, sensible folders, etc.) of the victim’s disk with files. Besides the abstract definition of this family of solutions, we present an open-source tool that implements the mitigation and restoration phases, called [Ranflood](/DFAR/). In particular, Ranflood supports three flooding strategies, apt for different attack scenarios. At its core, Ranflood buys time for the user to counteract the attack, e.g., to access an unresponsive, attacked server and shut it down manually. We benchmark the efficacy of Ranflood by performing a thorough evaluation over 6 crypto-ransomware (e.g., WannaCry, LockBit), showing that Ranflood consistently lowers the amount of files lost to encryption.


### RIG 

Wanting to validate this technique, we created an experimental setting using some workstations where we ran malware simulations (eg WannaCry, LockBit) contrasting them with RanFlood. This experimental setting deserves a separate chapter since it allows you to perform numerous tests in safety, with commonly used computers (simulating a situation as likely as possible) and without large investments such as the purchase of a server.




### Results 

![Results](/images/results.jpg)

Results of the aggregated tests, loss-rate percentage---each cell shows the percentage of valid (non-encrypted) files. For copy-based strategies we breakdown the percentage of valid files into a blue one (original) and agree none (restored), reporting the related percentages respectively at the bottom and at the top of the bar. The longer the blue/green bar, the better.