#!/bin/bash

#################################################################################
## 		ANT SETUP							#
## This is script will download and install apache-ant-1.9.11 			#
#################################################################################

ant_archive="apache-ant-1.9.11-bin.tar.gz"
ant_dir="apache-ant-1.9.11"
ant_dest="/usr/lib/ant"
ant_executable="/usr/bin/ant"

install_ant()
{
 ant -version >/dev/null 2>&1
 if [ $? -ne 0 ]
 then
     echo -e "\n\e[41m[INFO]\e[0m Aapache Ant not installed in your system"
    
     if [ ! -f $ant_archive ]
     then
        echo -e "\n\e[43m[INFO]\e[0m Downloading: $ant_archive"
        wget http://www-eu.apache.org/dist//ant/binaries/apache-ant-1.9.11-bin.tar.gz >/dev/null 2>&1
        
        if [ $? -eq 0 ]
	then
	    echo -e "\n\e[42m[SUCCESS]\e[0m $ant_archive downloaded successfully"
            echo -e "\n\e[43m[INFO]\e[0m Installing Apache Ant......."
            tar -zxf $ant_archive >/dev/null 2>&1
	    sudo mkdir $ant_dest
	    sudo mv $ant_dir $ant_dest
	    sudo update-alternatives --install "$ant_executable" "ant" "$ant_dest/$ant_dir/bin/ant" 1
	    ant -version
	    echo -e "\n\e[42m[SUCCESS]\e[0m Apache Ant setup has been completed successfully......\n"
	else
	    echo -e "\n\e[41m[ERROR]\e[0m Apache Ant installtion failed!....."
	fi
    else
	echo -e "\n\e[43m[INFO]\e[0m Installing Apache Ant......."
        tar -zxf $ant_archive >/dev/null 2>&1
        sudo mkdir $ant_dest
        sudo mv $ant_dir $ant_dest
        sudo update-alternatives --install "$ant_executable" "ant" "$ant_dest/$ant_dir/bin/ant" 1
        ant -version
    fi
 else
     echo -e "\e[42m[INFO]\e[0m Apache Ant already installed in your system."
     ant -version
     echo " "
 fi
}

