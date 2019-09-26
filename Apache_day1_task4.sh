#4. 
curl -iL www.anton.pavlovsky/index.html
systemctl stop httpd.service
less messages | grep -e "Apache" -e "ping.html" | tail -10
