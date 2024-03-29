#!/bin/bash
# Script to build the maven project then copy the resulting war file to the webapps directory.

# Skip checking every blasted file for the license at the top...
cd /home/Agora/guacamole-client/guacamole
mvn -Drat.skip=true package
cd target

# Now copy the war file with an appropriate name to the tomcat webapps folder
mv agora-1.war agora.war
cp agora.war /home/Agora/webapps

# Delete the renamed war file so we don't have problems building next time
rm -r agora.war
echo "agora app deployed"

# Restart required services
systemctl restart guacd
systemctl restart tomcat9
echo "Agora should be ready"
echo "If any services failed to restart, try 'sudo systemctl restart guacd' and 'sudo systemctl restart tomcat9'"
