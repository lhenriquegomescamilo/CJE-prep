CJE Prep
===============

This repository was made to create and configure a Vagrant Virtual Machine with a Tomcat/Jenkins instance with the required plugins for the [Certified Jenkins Engineer Test](https://www.cloudbees.com/jenkins/jenkins-certification) (2016 edition). 

Something I should add: This project will probably be upgraded to create and configure a [Jenkins](https://jenkins.io/) instance with some example projects. After I take the test (August), I'll probably transform this in a production-ready Jenkins (remove/add plugins for a more realistic production enviroment)

Usage
==

First, install [Virtual Box](https://www.virtualbox.org/) (Download a 4.x version) and [Vagrant](https://www.vagrantup.com/). These tools will help creating an virtual machine enviroment with minimun configuration and maximum portability.

After these tools were installed, add the [Vagrant Reload plugin](https://github.com/aidanns/vagrant-reload), with this simple terminal command:

`vagrant plugin install vagrant-reload` 

This plugin helps rebooting the VM automaticaly after provisioning. Vagrant will download the box, run a few scripts to install, update and configure the tools needed by our Jenkins server
