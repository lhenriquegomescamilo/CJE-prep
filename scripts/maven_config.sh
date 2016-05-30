# Create dir
cd /opt/
mkdir tools
cd tools/

# Download the zip
wget http://mirror.nbtelecom.com.br/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip
unzip apache-maven-3.3.9-bin.zip
rm apache-maven-3.3.9-bin.zip
ln -s apache-maven-3.3.9 maven

# Export path forever
cp /vagrant/scripts/maven.sh /etc/profile.d/
chmod 755 /etc/profile.d/maven.sh