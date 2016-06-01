CJE Prep
===============

This repository was made to create and configure a Vagrant Virtual Machine with a Tomcat/Jenkins instance with the required plugins and some example Jobs for the [Certified Jenkins Engineer Test](https://www.cloudbees.com/jenkins/jenkins-certification) (2016 edition). 


## Usage

First, install [Virtual Box](https://www.virtualbox.org/) (Download a 4.x version) and [Vagrant](https://www.vagrantup.com/). These tools will help creating an virtual machine enviroment with minimun configuration and maximum portability.

After these tools were installed, add the [Vagrant Reload plugin](https://github.com/aidanns/vagrant-reload), with this simple terminal command:

`vagrant plugin install vagrant-reload` 

This plugin helps rebooting the VM automaticaly after provisioning. Vagrant will download the box, run a few scripts to install, update and configure the tools needed by our Jenkins server. And for that, you only need to type:

`vagrant up` 

This `vagrant up` command will run for a long time (up to a few hours on the first time, depending on the internet connection), since it will download the vm image (actually, a "box", but essencially the same), and run all provision scripts, updating a lot of apt-get packages, jenkins plugins... Fortunatly, the box will be downloaded only on the first time, but every time you decide to destroy (`vagrant destroy`) your machine, the provision scripts will run the next time you start it (`vagrant up`).

### Configurations

Fortunately, most tools are instaled/updated with the scripts, but a few configurations may be necessary to use Jenkins (that's the whole point, isn't it? prepare for the CJE? Sometimes I think I forget that). Until now, these are the necessary configurations:

* Maven instalation. Go to the [configuration panel](http://127.0.0.1:8080/configure) -> Maven -> Maven Instalations:
  1. Name: any name you like. I use 'maven 3.3.9'
  2. Install automatically: uncheck
  3. MAVEN_HOME: '/opt/tools/maven/'
  
## Backlog

Open to sugestions. A few:

* Create example jobs on jenkins-cli
* Create jenkins nodes (multiple enviroments?) - maybe use docker.

## Contributing

Also preparing for the test? Created a nice job configuration? A good example for plugin usage? Feel free to fork and create pull requests.
