# TASK 2

user='anton.pavlovsky'

mkdir -p /var/www/html/$user/public_html
cat << EOF > /var/www/html/$user/public_html.index.html
<h3> HTTPD </h3>

<h2> link site avalaible - <b>anton.pavlovsky<b> or <b>www.anton.pavlovky<b> in your browser

EOF

mkdir -p /var/www/html/$user/{public_html, logs}

# 2.2
cat << EOF > /etc/httpd/conf.d/$user.conf

NameVirtualHost *:80
<VirtualHost *:80>
    ServerName www.anton.pavlovsky
    ServerAlias anton.pavlovsky
    DocumentRoot /var/www/html/anton.pavlovsky/public_html
    ErrorLog /var/www/html/anton.pavlovsky/error.log
    CustomLog /var/www/html/anton.pavlovsky/requests.log combined
</VirtualHost>

EOF

#2.4 See screenshots

# on host machine for test
cat << EOF > /etc/hosts
10.6.144.85 www.anton.pavlovsky
10.6.144.85 anton.pavlovsky

EOF

#2.5
cat << EOF > /var/www/html/anton.pavlovsky/public_html/ping.html
<h2>This is ping.html</h2>
<h3> site anton.pavlovsky</h3>
<hr />
<p>Created by Anton Pavlovsky</p>

EOF

#2.6
# See screenshots

#2.7 
systemctl restart httpd.service 
#see screenshots

#2.8
#see screenshots


