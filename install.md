---
layout: default
title: Install
---

<div class="container">

<div class="section-title">
  <h2>How to get Ranflood working</h2>
  <p>Sources and Installation</p>
</div>

<div class="row content" markdown="1">

<section>
<p markdown="1">
Ranflood's source code is hosted within the [Flooding-against-Ransomware](https://github.com/Flooding-against-Ransomware) GitHub organisation in the repository [https://github.com/Flooding-against-Ransomware/ranflood]().
</p>

<h4>A brief overview on Ranflood's architecture</h4>

<p markdown="1">
Ranflood follows the well-known client-daemon pattern (like Docker or systemd).
The **daemon** is an always-active component, and it is used both to take snapshots
of files and to execute flooding commands. The expected configuration for
Ranflood deployments is thus to have one daemon running on a given machine,
while several **client**s can connect to the same daemon. The daemon is a process in
the background, not associated with a particular user, and users/programs
interact with it with lightweight, asynchronous clients/interfaces (at the
moment, the Ranflood daemon supports client interaction through the ZeroMQ
protocol).
</p>

<hr class="my-5">

<h4>Installing Ranflood using the compiled binaries</h4>

<p>The Ranflood repository hosts also all version releases, which includes native
executables for Windows, macOS, and Windows, as well as a Java version that can
run on any environment that supports the Java Virtual Machine.</p>

<p class="text-center my-5">
<a target="_blank"
href="https://github.com/Flooding-against-Ransomware/ranflood/releases/latest"><button
type="button" class="btn btn-info fs-3">Download the latest release of <br>Ranflood
(GitHub)</button></a></p>

The release archives contain both the Ranflood client and daemon for the
selected environment---one can also mix different executables, e.g., if the user
needs to control a Windows computer where the daemon is running from a Linux
administration node.

<div markdown="1">
After having downloaded the binaries of Ranflood, you can execute following the steps below:

- uncompress the downloaded ZIP archive, which contains **both the daemon**
  (called `ranfloodd`) **and the client** (`ranflood`);
- make sure both binaries have **executable permissions** (e.g., in macOs/Linux
  with the command `chmod +x ranflood*`);
- move both binaries in a suitable location on the disk. We suggest having both
  executables in the local PATH, so that they are generally available (e.g., by
  typing their name in a terminal prompt).
- (optional) you can already configure the daemon before starting it through its
  settings file, e.g., see the illustrative
  [settings.ini](https://github.com/Flooding-against-Ransomware/ranflood/blob/master/src/tests/java/playground/settings.ini)
  file in the Ranflood's repository;
- start the daemon (`ranfloodd`)---our suggestion is to make it a system service
  launched with elevated rights at startup;
- start the client (`ranflood`) to interact with the daemon (e.g., launch/stop
  ransomware countermeasures and check their status).

</div>

<hr class="my-5">

<h4>Installing Ranflood from the sources</h4>

<div markdown="1">

The Ranflood project is currently written in Java and uses the GraalVM compiler
to generate native executables for the main operating systems, without requiring
the installation/presence of the Java Runtime Environment.

To compile the project from its sources, you need Java 18 and Gradle 7.0.
Download the code from the [GitHub
repository](https://github.com/Flooding-against-Ransomware/ranflood) and use the
included gradle script to compile it with the following commands:

- `gradle jar` generates the jar executables of both the client and the daemon;
- `gradle clientNativeImage` and `gradle clientNativeImage` respectively
  generate the native executable of the client and the daemon for the host
  operating system (the process might require the installation of GraamVM 22);

</div>

</section>
</div>
