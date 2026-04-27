                                                                                                                  
# Installing MySQL Community Server on Oracle Linux 9                                                                                                                                         
                                                                                                                                                                                               
This guide provides a step-by-step process for installing the latest open-source MySQL Community Server on Oracle Linux 9.                                                                       
                                                                                                                                                                                                  
---                                                                                                                                                                                              
<p>                                                                                                                                                                                                   
<strong>Step 1: Install the MySQL Repository</strong>                                                                                                                                                             
<br>
Oracle Linux 9 includes MySQL in its default AppStream repository, but it is often an older version. Add the official MySQL Community repository:                                                
</br>                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo dnf install -y https://dev.mysql.com/get/mysql84-community-release-el9-1.noarch.rpm</code>                                                                                            
</div>                                                                                                                                                                                           
</p>
<p>                                                                                                                                                                                                   
<strong>Step 2: Disable the Default MySQL Module</strong>
<br>                                                                                                                                                         
You must disable the default module to avoid version conflicts:                                                                                                                                  
</br>                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo dnf -qy module disable mysql</code>                                                                                                                                                   
</div>                                                                                                                                                                                           
</p>
<p>                                                                                                                                                                                                   
<strong>Step 3: Install the MySQL Server</strong>
<br>                                                                                                                                                                 
Install the server packages:                                                                                                                                                                     
</br>                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo dnf install -y mysql-community-server</code>                                                                                                                                          
</div>                                                                                                                                                                                           
</p>                                                                                                                                                                                                   
<p>
<strong>Step 4: Start and Enable the MySQL Service</strong>
<br>                                                                                                                                                       
Start the daemon and configure it to launch on boot:                                                                                                                                             
</br>                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo systemctl start mysqld && sudo systemctl enable mysqld</code>                                                                                                                         
</div>                                                                                                                                                                                                                                                                                                                                                                                        
</p>
<p>
<strong>Step 5: Retrieve the Temporary Root Password</strong>
<br>                                                                                                                                                     
Find the temporary password generated during installation:                                                                                                                                       
</br>                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo grep 'temporary password' /var/log/mysqld.log</code>                                                                                                                                  
</div>                                                                                                                                                                                           
</p>
<p>                                                                                                                                                                                                   
<strong>Step 6: Secure the Installation</strong>
<br>                                                                                                                                                                  
Run the security script. You will need the password from Step 5.                                                                                                                                 
</br>                                                                                                                                                                                                   
<div style="background-color: #f4f4f4; border-radius: 10px; padding: 15px; border: 1px solid #ddd;">                                                                                             
<code>sudo mysql_secure_installation</code>                                                                                                                                                      
</div>                                                                                                                                                                                           
</p>
