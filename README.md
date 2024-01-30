# AutomationScripts
Extracts IP Blocks from GeoLite2 Databases by Country Code

Use with HaProxy to Whitelist/Blacklist IP Blocks

--
The script will generate two files. 

locations.lst: This is where you can find country codes for the IP blocks you need.
whitelisted-ip.lst: This is a file generated with IPv4 and IPv6 from the country codes you entered on geoip.sh.
