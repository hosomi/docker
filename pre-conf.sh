#!/bin/bash

chgrp -R tomcat8 /etc/tomcat8
chmod -R g+w /etc/tomcat8 

# to increase size of war file can be upload ..
sed -i 's/<!-- 50MB max -->/<!-- 500MB max -->/'  /usr/share/tomcat8-admin/manager/WEB-INF/web.xml
sed -i 's/<max-file-size>52428800<\/max-file-size>/<max-file-size>524288000<\/max-file-size>/'  /usr/share/tomcat8-admin/manager/WEB-INF/web.xml
sed -i 's/<max-request-size>52428800<\/max-request-size>/<max-request-size>524288000<\/max-request-size>/' /usr/share/tomcat8-admin/manager/WEB-INF/web.xml
