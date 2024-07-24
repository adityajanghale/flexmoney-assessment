#!/bin/bash
 
BRANCH_NAME=$1
SERVERS=$2
 
for SERVER in ${SERVERS[@]}
do
  ssh user@$SERVER "git clone -b $BRANCH_NAME https://github.com/adityajanghale/flexmoney-assessment.git /var/www/backend || (cd /var/www/backend && git pull origin $BRANCH_NAME)"
  ssh user@$SERVER "cd /var/www/backend && ./gradlew build && mv build/libs/app.jar /var/www/backend/app.jar"
  ssh user@$SERVER "nohup java -jar /var/www/backend/app.jar &"
done

