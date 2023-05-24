---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: page
---


# RanFlood - sito in costruzione

Ransomware is one of the most infamous kinds of malware, particularly the “crypto” subclass, which encrypts users’ files, asking for some monetary ransom in exchange for the decryption key. Recently, crypto-ransomware grew into a scourge for enterprises and governmental institutions. The most recent and impactful cases include an oil company in the US, an international Danish shipping company, and many hospitals and health departments in Europe. Attacks result in production lockdowns, shipping delays, and even risks to human lives. To contrast ransomware attacks (crypto, in particular), we propose a family of solutions, called Data Flooding against Ransomware, tackling the main phases of detection, mitigation, and restoration, based on a mix of honeypots, resource contention, and moving target defence. These solutions hinge on detecting and contrasting the action of ransomware by flooding specific locations (e.g., the attack location, sensible folders, etc.) of the victim’s disk with files. Besides the abstract definition of this family of solutions, we present an open-source tool that implements the mitigation and restoration phases, called Ranflood. In particular, Ranflood supports three flooding strategies, apt for different attack scenarios. At its core, Ranflood buys time for the user to counteract the attack, e.g., to access an unresponsive, attacked server and shut it down manually. We benchmark the efficacy of Ranflood by performing a thorough evaluation over 6 crypto-ransomware (e.g., WannaCry, LockBit) for a total of 78 different attack scenarios, showing that Ranflood consistently lowers the amount of files lost to encryption.