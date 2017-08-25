#!/bin/bash

# Configure CEPappliance


CEPAPPLIANCE_IP_ADDR=""
CEPAPPLIANCE_LICENSE_PATH=../valid.license


java -jar -Xmx1G -Xms1G \
	-ea /home/trade/bin/cepappliance-config.jar \
	-appliance $CEPAPPLIANCE_IP_ADDR \
	-license $CEPAPPLIANCE_LICENSE_PATH \
	./schema.xml
