#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Update Package List

apt-get update

# Update System Packages
apt-get -y upgrade

# Remove those dependencies that were installed with applications and that are no longer used by anything else on the system.
apt-get autoremove && apt-get autoclean


# Install Some PPAs

apt-get install -y software-properties-common curl

apt-add-repository ppa:nginx/stable -y
apt-add-repository ppa:chris-lea/redis-server -y


curl --silent --location https://deb.nodesource.com/setup_8.x | bash -

# Update Package Lists

apt-get update

# Install Some Basic Packages

apt-get install -y nodejs npm

nodejs -v
npm  -v


# Install PM2

npm install pm2 -g


# Install Nginx & PHP-FPM

apt-get install -y nginx

rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
sudo cp /home/ubuntu/awssh/nginx_vhost /etc/nginx/sites-available/nginx_vhost
sudo ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/


systemctl restart nginx
# sudo service nginx restart

# Installing Jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list

apt-get update
apt-get install jenkins -y

# Start jenkins as service
systemctl start jenkins



# Set The Nginx & PHP-FPM User

sed -i "s/user www-data;/user jenkins;/" /etc/nginx/nginx.conf
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 64;/" /etc/nginx/nginx.conf


service nginx restart


# Add jenkins User To WWW-Data

usermod -a -G www-data jenkins
id jenkins
groups jenkins



# Install MariaDB 10.1
sudo apt-get install -y mariadb-server mariadb-client

# If it’s not running, start it with this command:
sudo systemctl start mysql

#To enable MariaDB to automatically start when Ubuntu 16.04 is rebooted:
sudo systemctl enable mysql

# Now run the post installation security script.
mysql_secure_installation


# Configure Supervisor

systemctl daemon-reload

systemctl enable supervisor.service
service supervisor start


# One last upgrade check

apt-get -y upgrade

# Clean Up

apt-get -y autoremove
apt-get -y clean
chown -R jenkins:www-data /var/www

# Enable Swap Memory

/bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
/sbin/mkswap /var/swap.1
/sbin/swapon /var/swap.1

apt-get -y autoremove;
apt-get -y clean;

echo "Finished server setup."

