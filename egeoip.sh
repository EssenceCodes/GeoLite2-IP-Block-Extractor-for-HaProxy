maxmind_license="ENTER YOUR LICENSE HERE"

#Sample Country Codes
US=6252001
CA=6251999

#Download Database
wget -q -O countries.zip "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&license_key=${maxmind_license}&suffix=zip" && unzip countries.zip

#Extract Data
cat ./GeoLite2-Country-CSV_*/GeoLite2-Country-Blocks-IPv4.csv | grep '6252001\|6251999' | awk -F "," '{print $1}' > whitelisted-ip.lst

#Cleanup
rm countries.zip
rm -Rf GeoLite2*
