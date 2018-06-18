#!/bin/bash

##########################################################################################
##				JENKINS SETUP						##
##			-----------------------------					##
## This script will call several functions from other scripts to setup jenkins		##
##########################################################################################

source ./java-setup.sh
source ./ant-setup.sh
source ./robotframework-setup.sh
source ./firewall-conf.sh

jenkins_pre_setup()
{
 if [ -f java-setup.sh ] && [ -f ant-setup.sh ] && [ -f ./robotframework-setup.sh ];
 then
     install_java
     if [ $? -ne 0 ];
     then
    	 exit 0
     fi

     install_ant
     if [ $? -ne 0 ];
     then
	exit 0
     fi
     
     robotframework_setup
     if [ $? -ne 0 ];
     then
	exit 0
     fi
 else 
     echo -e "\n\e[42m[SUCCESS]\e[0m Jenkins pre-requisites completed"
 fi
}


jenkins_setup()
{   
 jenkins_installer="jenkins-2.121.1-1.1.noarch.rpm"

 if [ -e /etc/init.d/jenkins ];
 then
     echo -e "\n\e[42m[INFO]\e[0m Jenkins already installed in your system.\n" 
     exit 0
 fi

 if [ -f $jenkins_installer ]
 then
     echo -e "\n\e[43m[INFO]\e[0m Jenkins installer found, proceeding with installation...."
     sudo rpm -ivh $jenkins_installer >/dev/null 2>&1

     if [ $? -eq 0 ]
     then
         echo -e "\n\e[42m[INFO]\e[0m Jenkins setup has been completed successfully......\n"
     else
         echo -e "\n\e[41m[ERROR]\e[0m Jenkins installtion failed!....."
     fi
 else
    echo -e "\n\e[43m[INFO]\e[0m Downloading $jenkins_installer"
    wget https://pkg.jenkins.io/redhat-stable/jenkins-2.121.1-1.1.noarch.rpm >/dev/null 2>&1
    
    if [ $? -eq 0 ]
    then
	echo -e "\n\e[42m[SUCCESS]\e[0m$jenkins_installer downloaded successfull, and proceeding with installation...."
        sudo rpm -ivh $jenkins_installer >/dev/null 2>&1

        if [ $? -eq 0 ]
        then
            echo -e "\n\e[42m[INFO]\e[0m Jenkins setup has been completed successfully......\n"
        else
            echo -e "\n\e[41m[ERROR]\e[0m Jenkins installtion failed!....."
        fi  
    else
	echo -e "\n\e[41m[ERROR]\e[0m Download failed!....."
    fi
 fi
}

# Calling above functions
jenkins_pre_setup
jenkins_setup
enable_firewall_port

