#!/bin/bash

#################################################################################
#	ROBOTFRAMEWORK & ROBOTFRAMEWORK-RIDE SETUP				#
# This script will setup robotframwork and robotframework-ride			#
#										#
# Instructions: Please place the below files in the base directory		#
#	1. robotframework-2.8.7.tar.gz						#
#	2. Plerobotframework-ride-1.3.tar.gz					#
#################################################################################

robotframework_setup()
{
 robotframework_archive="robotframework-2.8.7.tar.gz"
 robotframework_ride_archive="robotframework-ride-1.3.tar.gz"
 robotframework_base_dir="robotframework"
 robotframework_ride_base_dir="robotframework-ride"
 robotframework_src_dir="robotframework-2.8.7"
 robotframework_ride_src_dir="robotframework-ride-1.3"

 echo -e "Your home directory: \e[43m$HOME\e[0m \n"

# creating temporary workspace/directories
 if [ -f $robotframework_archive ] && [ $robotframework_ride_archive ]
 then
     echo -e "\n\e[43m[INFO]\e[0m robotframework archives found. \n1.$robotframework_archive \n2.$robotframework_ride_archive"
     mkdir $robotframework_base_dir $robotframework_ride_base_dir
     echo -e "\n\e[43m[INFO]\e[0m Directories created. \n1. $robotframework_base_dir \n2. $robotframework_ride_base_dir"
     
     cp -r $robotframework_archive $robotframework_base_dir
     cd $robotframework_base_dir
     tar -zxvf $robotframework_archive >/dev/null 2>&1
     cd $robotframework_src_dir
     sudo python setup.py install >/dev/null 2>&1

     if [ $? -eq 0 ]
     then
	echo -e "\n\e[42m[SUCCESS]\e[0m $robotframework_src_dir installed successfully....."
     else
	echo -e "\n\e[41m[ERROR]\e[0m $robotframework_src_dir failed to install....."
     fi
     
     cd $HOME
     cp -r $robotframework_ride_archive $robotframework_ride_base_dir
     cd $robotframework_ride_base_dir
     tar -zxvf $robotframework_ride_archive >/dev/null 2>&1
     cd $robotframework_ride_src_dir
     sudo python setup.py install  >/dev/null 2>&1

     if [ $? -eq 0 ]
     then
        echo -e "\n\e[42m[SUCCESS\e[0m $robotframework_ride_src_dir installed successfully....."
     else
        echo -e "\n\e[41m[ERROR]\e[0m $robotframework_ride_src_dir failed to install....."
     fi

 else 
     echo -e "\e[43m[WARNING]\e[0m robotframework archives missing. Please add below files:\n1. $robotframework_archive \n2. $robotframework_ride_archive"
 exit 0
 fi
}

