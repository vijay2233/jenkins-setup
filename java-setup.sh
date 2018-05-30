#!/bin/bash
#################################################################################################
# 			     JAVA SETUP								#
# 	 		---------------------							#
# NOTE: Please review and change the script path/filenames accordingly				#
#################################################################################################

# verify and install JDK (JRE is enough to run Jenkins but intalling JDK to compile java source)

sudo yum -y install wget

install_java()
{
java_rpm_file='jdk-8u171-linux-x64.rpm'

java -version >/dev/null 2>&1
if [ $? -ne 0 ]
then
	echo -e "\n\e[41m[INFO]\e[0m java not installed in your system"

	if [ ! -f $java_rpm_file ]
	then
            echo -e "\n\e[44m[INFO]\e[0m Downloading java installer: $java_rpm_file"
            wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.rpm" >/dev/null 2>&1
            echo -e "\n\e[42m[SUCCESS]\e[0m $java_rpm_file downloaded successfully"
            echo -e "\n\e[43m[INFO]\e[0m installing $java_rpm_file....."
            sudo rpm -ivh $java_rpm_file
	    echo " "
            java -version
           
            else
                echo -e "\n\e[43m[INFO]\e[0m $java_rpm_file exists, proceeding with installation"
             	sudo rpm -ivh $java_rpm_file
                echo " "
	 	java -version
	 fi
else
    echo -e "\n\e[42m[INFO]\e[0m java already installed on your system \n"
    java -version
    echo -e " "
fi
}


