# limit access to pem file
chmod 400 .ssh/filename.pem 

# Connect to server through ssh
ssh -i .ssh/filename.pem ubuntu@servername

# Download letsencript
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt

# Fix
export LC_ALL="C"


# Goto 
cd /opt/letsencrypt

# Run lets encript to generate ssl certificate for this domain
./letsencrypt-auto certonly --standalone --email user@example.com -d your.domain.com

# To see files were created or not
sudo ls /etc/letsencrypt/live/your.domain.com

# Prepare for serversetup
git clone https://bitbucket.org/behestee/awssh.git
cd awssh
chmod +x setup_aws.sh
sudo ./setup_aws.sh

# Modify Domain Name as necessary
sudo vim  /etc/nginx/sites-available/nginx_vhost
sudo vim /etc/hosts

# Restart server
sudo service nginx restart


# Know nginx status
sudo service nginx status

# Get First Password for Jenkins and Configure for Project
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


