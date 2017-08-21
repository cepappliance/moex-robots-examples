#!/bin/bash

# Запуск эмулятора.
# Компиляция и заливка схемы в эмулятор.
# Скрипт корректно завершается по нажатию Ctrl+c.


FPGA_LICENSE_PATH=../valid.license


java -Xmx1G -Xms1G -ea -Dcom.cepappliance.log.level=*:DBG -Djava.net.preferIPv4Stack=true \
    -jar ../cep/cepappliance-emul.jar \
    1> emulator.log 2> emulator_err.log &

emulator_pid=$!
echo "Emulator PID: " $emulator_pid

tail -f ./emulator_err.log -n 0 &
tail_pid=$!
echo "tail PID: " $tail_pid

sleep 1

java -Xmx1G -Xms1G -ea -Dcom.cepappliance.fpga.log.handler=FPGATsLogHandlerSTDOUT \
    -jar ../cep/cepappliance-config.jar \
    -appliance localhost:21761 \
    -license $FPGA_LICENSE_PATH \
    ./main.xml \
    2>&1 | tee -i ./schema.log


echo "Завершаю эмулятор."
kill $emulator_pid

echo "Завершаю tail."
kill $tail_pid

wait
