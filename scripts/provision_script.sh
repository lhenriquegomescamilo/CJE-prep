# Include hosts in the /etc/hosts
echo "192.168.2.2 esec-server" >> /etc/hosts
echo "192.168.2.3 db-server" >> /etc/hosts
echo "192.168.2.7 devtools" >> /etc/hosts

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

# Copy tomcat startup script to init.d
cp /vagrant/scripts/tomcat.sh /etc/init.d/
chmod 755 /etc/init.d/tomcat.sh
chmod 755 /opt/server/tomcat7/bin/*.sh

# Start tomcat
/etc/init.d/tomcat.sh restart

# Jenkins stuff (Install plugins...)
chmod 755 /vagrant/scripts/jenkins.sh
/vagrant/scripts/jenkins.sh