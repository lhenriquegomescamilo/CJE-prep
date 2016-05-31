# fix files edited in windows with ^M at the end of files
sed -i -e 's/\r$//' /vagrant/scripts/*
sed -i -e 's/\r$//' /vagrant/files/*

# Install java, zip, unzip, git and upgrade everything
apt-get -y -q update
apt-get -y -q upgrade
apt-get -y -q install software-properties-common htop
add-apt-repository ppa:webupd8team/java
apt-get -y -q update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
apt-get -y -q install oracle-java8-installer
update-java-alternatives -s java-8-oracle

apt-get update && apt-get -y install zip unzip git
apt-get upgrade

# Install Maven
chmod 755 /vagrant/scripts/maven_config.sh
sudo /vagrant/scripts/maven_config.sh

# move to right directory
cd /opt/
mkdir server
cd server/

# Download and unzip Tomcat
wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.zip
unzip apache-tomcat-7.0.69.zip
rm apache-tomcat-7.0.69.zip
ln -s apache-tomcat-7.0.69 tomcat7

# Download jenkins
wget http://mirrors.jenkins-ci.org/war-stable/1.625.2/jenkins.war

# Copy Jenkins to Tomcat
mv jenkins.war tomcat7/webapps/

# Configure and start tomcat
chmod 755 /vagrant/scripts/tomcat_config.sh
sudo /vagrant/scripts/tomcat_config.sh

# Configure Jenkins (Install plugins, create jobs...)
chmod 755 /vagrant/scripts/jenkins.sh
sudo /vagrant/scripts/jenkins.sh