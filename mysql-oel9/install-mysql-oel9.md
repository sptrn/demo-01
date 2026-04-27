Step 1: Install The MySQL Repo
------------------------------
Oracle Linux 9 includes MySQL in its default AppStream repo, but it is
often a older version. To get the latest open-source version, add the 
official MySQL Community repo.
---
sudo dnf install -y https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm
---

Step 2: Disable the default MySQL Module (Required)
---------------------------------------------------
Oracle Linux has a default MySQL module that may conflict with the community
version. You must disable it.
---
sudo dnf -qy module disable mysql
---

Step 3: Install the MySQL server.
---------------------------------
Now you can install the MySQL server packages.
---
sudo dnf install -y mysql-community-server
---

Step 4: Start and Enable MySQL 
------------------------------
Start the Service and set it to run automatically on boot.
---
sudo systemctl start mysqld
sudo systemctl enable mysqld
---

Step 5: Get The Temporary Root Password
---------------------------------------
MySQL generates a temporary password for the root user during installation.
Find it by running;
---
sudo grep 'temporary password' /var/log/mysqld.log
---

Step 6: Secure The Installation
-------------------------------
Run the security script to change your password and remove insecure default
settings. You have to enter the 'temporary password' from Step 5 at the
first prompt.
---
sudo mysql_secure_installation
---
