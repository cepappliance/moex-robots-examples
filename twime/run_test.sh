#!/bin/bash

# Запускает конфигуратор на несуществующий адрес. 
# Это позволяет проверить компиляцию схемы без заливки.


FPGA_LICENSE_PATH=../valid.license


java -Xmx2048m -ea -Dcom.cepappliance.fpga.log.handler=FPGATsLogHandlerSTDOUT \
    -jar ../cep/cepappliance-config.jar \
    -appliance localhost:12345 \
    -license $FPGA_LICENSE_PATH \
    ./main.xml

