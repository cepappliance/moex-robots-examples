#/bin/bash

if [ $# -ne 1 ]; 
    then 
        echo "usage: cepappliance-config.sh <schema>"
        exit
fi

sudo rmmod ./pcie/driver/cepappliance-pcie.ko
sleep 0.3
sudo setpci -s 00:03.2 a0.b=10:10
sleep 0.3
echo 1 | sudo tee /sys/bus/pci/devices/0000\:00\:03.2/remove
sleep 0.3

quartus_pgm --mode=jtag --operation="p;./img/img.0.17.sof" 

sleep 0.3
echo 1 | sudo tee /sys/bus/pci/rescan
sleep 0.3
sudo setpci -s 00:03.2 a0.b=00:10
sleep 0.3
sudo setpci -s 00:03.2 3e.b=40:40
sleep 0.3
sudo setpci -s 00:03.2 3e.b=00:40
sleep 0.3
echo 1 | sudo tee /sys/bus/pci/rescan
sleep 0.3
lspci | grep Altera
sudo insmod ./pcie/driver/cepappliance-pcie.ko

sleep 60

java -Xmx512m -ea -Dcom.cepappliance.fpga.log.handler=FPGATsLogHandlerSTDOUT -Dcom.cepappliance.log.level=*:DBG -jar ./cepappliance-config.jar -appliance 10.218.72.71:21761 $1
