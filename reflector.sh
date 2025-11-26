#!/bin/bash
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

			
			
			
			
			# cd /home/pi/YSFClients/YSFGateway
			#sudo wget -O YSFHosts.txt http://register.ysfreflector.de/export_csv.php 
            
			
			#curl https://hostfiles.refcheck.radio/YSFHosts.txt > /home/pi/YSFClients/YSFGateway/YSFHosts.txt
			
			sudo rm /home/pi/YSFHosts.txt
wget --user-agent="YSFGateway" https://hostfiles.refcheck.radio/YSFHosts.txt
sudo cp /home/pi/YSFHosts.txt /home/pi/YSFClients/YSFGateway/
sudo chmod 777 /home/pi/YSFClients/YSFGateway/YSFHosts.txt

			sleep 3
			
			clear
			echo "${VERDE}**********************************"
					echo "*  ACTUALIZANDO REFLECTORES YSF  *"
					echo "**********************************"
			sleep 3
			