# Download Jenkins-cli
cd /opt/server/
wget http://localhost:8080/jenkins/jnlpJars/jenkins-cli.jar

# Install plugins (list in README_plugins)
java -jar /opt/server/jenkins-cli.jar -s http://127.0.0.1:8080/jenkins install-plugin ec2 build-pipeline-plugin docker-build-publish cloudbees-folder copyartifact credentials delivery-pipeline-plugin disk-usage docker-plugin email-ext create-fingerprint git mailer ircbot junit jabber matrix-project nodelabelparameter parameterized-trigger workflow-aggregator promoted-builds radiatorviewplugin sms script-security skype-notifier

#install other pugins (also on README_plugins)
java -jar /opt/server/jenkins-cli.jar -s http://127.0.0.1:8080/jenkins install-plugin greenballs

# Updates all plugins
UPDATE_LIST=$( java -jar /opt/server/jenkins-cli.jar -s http://127.0.0.1:8080/jenkins list-plugins | grep -e ')$' | awk '{ print $1 }' ); 
if [ ! -z "${UPDATE_LIST}" ]; then 
    echo Updating Jenkins Plugins: ${UPDATE_LIST}; 
    java -jar /opt/server/jenkins-cli.jar -s http://127.0.0.1:8080/jenkins install-plugin ${UPDATE_LIST};
fi

# Restart jenkins
java -jar /opt/server/jenkins-cli.jar -s http://127.0.0.1:8080/jenkins safe-restart;