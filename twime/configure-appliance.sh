#!/bin/bash

# Configure CEPappliance


CEPAPPLIANCE_IP_ADDR="<please-specify-host-address>"
CEPAPPLIANCE_LICENSE_PATH=../test.license


java -Xmx1G -Xms1G -ea \
	-jar ../bin/cepappliance-config.jar \
	-license $CEPAPPLIANCE_LICENSE_PATH \
	-appliance $CEPAPPLIANCE_IP_ADDR \
    -adapters adapters.xml \
	schema.xml
