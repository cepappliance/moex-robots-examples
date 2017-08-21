#!/bin/bash

# Компиляция и заливка схемы на устройство.


FPGA_IP_ADDR=""
FPGA_LICENSE_PATH=../valid.license


java -jar -Xmx1G -Xms1G \
	-ea /home/trade/cep/cepappliance-config.jar \
	-appliance $FPGA_IP_ADDR \
	-license $FPGA_LICENSE_PATH \
	./main.xml
