# Copy tomcat startup script to init.d
cp /vagrant/scripts/tomcat.sh /etc/init.d/
chmod 755 /etc/init.d/tomcat.sh
chmod 755 /opt/server/tomcat7/bin/*.sh

# Server config (UTF-8 URIs)
cp /vagrant/files/server.xml /opt/server/tomcat7/conf/

# Start tomcat
sudo /etc/init.d/tomcat.sh start