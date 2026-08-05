# Project 2 - Linux Users & Permissions

# Scenario 
you've just joined a company as a Junior DevOps Engineer.
Three new developers are joining the team: 
- Ahmed 
- Sara 
- Ali 

Your manager asks you to: 
1- Create user accounts for them.
2- Create a shared group called developers.
3- Give all developers access to a shared project directory.
4- Make sure users outside the group cannot modify the project.
5- Verify the permissions.

# objective 
Set up the users & Permissions 


# Commands
- sudo adduser <user_name>
sudo groupadd <group_name>
sudo usermod -aG developers <user_name>
sudo mkdir /opt/dev-project
sudo chgrp developers /opt/dev-project
sudo chmod 770 /opt/dev-project
