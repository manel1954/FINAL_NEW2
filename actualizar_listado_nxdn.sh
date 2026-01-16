#!/bin/bash
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo -e "${VERDE}Descargando NXDNHosts.txt...${GRIS}"

cd /home/pi/
wget --user-agent="NXDNGateway" https://hostfiles.refcheck.radio/NXDNHosts.txt

if [ -f /home/pi/NXDNHosts.txt ]; then
    echo -e "${VERDE}Archivo descargado correctamente${GRIS}"
    read a
    # Hacer backup del archivo anterior
    if [ -f /opt/NXDNClients/NXDNGateway/NXDNHosts.txt ]; then
        sudo cp /opt/NXDNClients/NXDNGateway/NXDNHosts.txt /opt/NXDNClients/NXDNGateway/NXDNHosts.txt.bak
        echo -e "${AMARILLO}Backup creado${GRIS}"
    fi
    read a
    # Mover el nuevo archivo
    sudo mv /home/pi/NXDNHosts.txt /opt/NXDNClients/NXDNGateway/
    sudo chown pi:pi /opt/NXDNClients/NXDNGateway/NXDNHosts.txt
    
    echo -e "${VERDE}NXDNHosts.txt actualizado correctamente${GRIS}"
    
    # Reiniciar NXDNGateway
    echo -e "${CIAN}Reiniciando NXDNGateway...${GRIS}"
    sudo systemctl restart nxdngateway
    
    echo -e "${VERDE}¡Proceso completado!${GRIS}"
    read a
else
    echo -e "${ROJO}Error al descargar el archivo${GRIS}"
fi

sleep 3