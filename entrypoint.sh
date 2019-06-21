#!/bin/sh

CFG=/etc/onetime/config

echo "##### Performing vars check #####"
for VAR in $OTS_DOMAIN $OTS_MASTER_KEY $OTS_REDIS_USER $OTS_REDIS_HOST $OTS_REDIS_PORT $OTS_ADMIN_EMAIL; do
  if [ -z "$VAR" ]; then
    echo "Required variable is not defined!"
    exit 1
  else
    echo "All required vars present."
  fi
done

echo "##### Building OTS configuration file from environment variables #####"
sed -i "s/__OTS_DOMAIN/$OTS_DOMAIN/g" $CFG
sed -i "s/__OTS_MASTER_KEY/$OTS_MASTER_KEY/g" $CFG
sed -i "s/__OTS_REDIS_PW/$OTS_REDIS_PW/g" $CFG
sed -i "s/__OTS_REDIS_HOST/$OTS_REDIS_HOST/g" $CFG
sed -i "s/__OTS_REDIS_PORT/$OTS_REDIS_PORT/g" $CFG

sed -i "s/__OTS_CREATE_SECRET/$OTS_CREATE_SECRET/g" $CFG
sed -i "s/__OTS_CREATE_ACCOUNT/$OTS_CREATE_ACCOUNT/g" $CFG
sed -i "s/__OTS_UPDATE_ACCOUNT/$OTS_UPDATE_ACCOUNT/g" $CFG
sed -i "s/__OTS_EMAIL_RECIPIENT/$OTS_EMAIL_RECIPIENT/g" $CFG
sed -i "s/__OTS_SEND_FEEDBACK/$OTS_SEND_FEEDBACK/g" $CFG
sed -i "s/__OTS_AUTHENTICATE_SESSION/$OTS_AUTHENTICATE_SESSION/g" $CFG
sed -i "s/__OTS_HOMEPAGE/$OTS_HOMEPAGE/g" $CFG
sed -i "s/__OTS_DASHBOARD/$OTS_DASHBOARD/g" $CFG
sed -i "s/__OTS_FAILED_PASSPHRASE/$OTS_FAILED_PASSPHRASE/g" $CFG
sed -i "s/__OTS_SHOW_METADATA/$OTS_SHOW_METADATA/g" $CFG
sed -i "s/__OTS_SHOW_SECRET/$OTS_SHOW_SECRET/g" $CFG
sed -i "s/__OTS_BURN_SECRET/$OTS_BURN_SECRET/g" $CFG

echo "##### Apply style customisations #####"
$OTS_FAV_ICON
$OTS_
# remove malinator info box
# remove email/account info box
# remove send feedback box
# enable api? -> then accounting is also needed
# change code,issues link
# remove social stuff
# change font
# get source from my fork
# set variables in css to replace them


echo "Starting OTS"
exec bundle exec thin -e dev -R config.ru -p 7143 start
