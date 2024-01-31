#!/bin/bash 

maxmind_license="ENTER YOUR LICENSE HERE"

#Sample Country Codes
US=6252001
CA=6251999
Israel=294640
UK=2635167
FR=3017382
Germany=2921044
Belgium=2802361
RU=2017370
UA=690791

#Checks for zip and wget packages
app=(zip wget)
for i in "${app[@]}"
do
   if ! command -v $i &> /dev/null
     then
   echo "Please install" $i
   exit
   fi
done

#Download Database
wget -q -O countries.zip "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&license_key=${maxmind_license}&suffix=zip" && unzip -q countries.zip

#Generates locations.lst file
cat ./GeoLite2-Country-CSV_*/GeoLite2-Country-Locations-*.csv >> locations.lst

#Enter Country Codes from locations.lst you would like to extract
#Below I am extracting IP Blocks from US and Canada
cat ./GeoLite2-Country-CSV_*/GeoLite2-Country-Blocks-IPv*.csv | grep '6252001\|6251999' | awk -F "," '{print $1}' >> whitelisted-ip.lst

#Cleanup
rm countries.zip
rm -Rf GeoLite2*
