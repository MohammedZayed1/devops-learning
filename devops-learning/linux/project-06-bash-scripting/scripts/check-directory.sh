#!/bin/bash 

if [ -d "/etc" ];

then
	echo "Directory exists."
	exit 0	
else 
	echo "Directory not found."
	exit 1
fi
