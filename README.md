# To access server via ssh limit access to pem file
```shell
chmod 400 .ssh/filename.pem 
```

# Connect to server through ssh
```shell
ssh -i .ssh/filename.pem ubuntu@servername
```

# Download letsencript for free SSL
```shell
sudo git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
```

# Fix
```shell
export LC_ALL="C"
```


# Goto 
```shell
cd /opt/letsencrypt
```

# Run lets encript to generate ssl certificate for this domain
```shell
./letsencrypt-auto certonly --standalone --email user@example.com -d your.domain.com
```

# To see files were created or not
```shell
sudo ls /etc/letsencrypt/live/your.domain.com
```

# Prepare for serversetup
```shell
cd ~
git clone https://bitbucket.org/behestee/awssh.git
cd awssh
chmod +x setup_aws.sh
sudo ./setup_aws.sh
```
> It will create and configure your server, just you need to modify the vhost conf, Jenkins configuration 
> and create your job at there. It also will install the mysql secure installation script and prompt you 
> for give your settings. 

# Modify Domain Name as necessary
```shell
sudo vim  /etc/nginx/sites-available/nginx_vhost
sudo vim /etc/hosts
```

# Restart nginx server

```shell
sudo service nginx restart
```

# Know nginx status

```shell
sudo service nginx status
```

# Get First Password for Jenkins and Configure for Project
```shell
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```


