#!/bin/bash

# Configures not reachable CEPappliance (on port 12345) 
# Used to make sure the given schema (schema.xml) is compilable


CEPAPPLIANCE_LICENSE_PATH=../valid.license

java -Xmx2048m -ea -Dcom.cepappliance.fpga.log.handler=CustomLogHandlerSTDOUT \
    -jar ../bin/cepappliance-config.jar \
    -appliance localhost:12345 \
    -license $CEPAPPLIANCE_LICENSE_PATH \
    ./schema.xml

