                                                                                                                  
# Installing MySQL Community Server on Oracle Linux 9                                                                                                                                         
                                                                                                                                                                                               
This guide provides a step-by-step process for installing the latest open-source MySQL Community Server on Oracle Linux 9.                                                                       
                                                                                                                                                                                                  
---                                                                                                                                                                                              
<p>                                                                                                                                                                                                   
Step 1: Install the MySQL Repository                                                                                                                                                             
Oracle Linux 9 includes MySQL in its default AppStream repository, but it is often an older version. Add the official MySQL Community repository:                                                
                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo dnf install -y https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm</code>                                                                                            
</div>                                                                                                                                                                                           
</p>
<p>                                                                                                                                                                                                   
Step 2: Disable the Default MySQL Module                                                                                                                                                         
You must disable the default module to avoid version conflicts:                                                                                                                                  
                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo dnf -qy module disable mysql</code>                                                                                                                                                   
</div>                                                                                                                                                                                           
</p>
<p>                                                                                                                                                                                                   
Step 3: Install the MySQL Server                                                                                                                                                                 
Install the server packages:                                                                                                                                                                     
                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo dnf install -y mysql-community-server</code>                                                                                                                                          
</div>                                                                                                                                                                                           
</p>                                                                                                                                                                                                   
<p>
Step 4: Start and Enable the MySQL Service                                                                                                                                                       
Start the daemon and configure it to launch on boot:                                                                                                                                             
                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo systemctl start mysqld && sudo systemctl enable mysqld</code>                                                                                                                         
</div>                                                                                                                                                                                                                                                                                                                                                                                        
</p>
<p>
Step 5: Retrieve the Temporary Root Password                                                                                                                                                     
Find the temporary password generated during installation:                                                                                                                                       
                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo grep 'temporary password' /var/log/mysqld.log</code>                                                                                                                                  
</div>                                                                                                                                                                                           
</p>
<p>                                                                                                                                                                                                   
Step 6: Secure the Installation                                                                                                                                                                  
Run the security script. You will need the password from Step 5.                                                                                                                                 
                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo mysql_secure_installation</code>                                                                                                                                                      
</div>                                                                                                                                                                                           
</p>
EOF
