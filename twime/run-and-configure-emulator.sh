#!/bin/bash

# Starts and configures CEPappliance Emulator.
# Gracefully terminates on Ctrl+C.

CEPAPPLIANCE_LICENSE_PATH=../test.license

java -Xmx1G -Xms1G -ea -Dcom.cepappliance.log.level=*:DBG -Djava.net.preferIPv4Stack=true \
    -jar ../bin/cepappliance-emul.jar \
    1> emulator.log 2> emulator_err.log &

emulator_pid=$!
echo "CEPappliance Emulator PID: " $emulator_pid

tail -f ./emulator_err.log -n 0 &
tail_pid=$!
# echo "tail PID: " $tail_pid

sleep 1

java -Xmx1G -Xms1G -ea -Dcom.cepappliance.fpga.log.handler=CustomLogHandlerSTDOUT \
    -jar ../bin/cepappliance-config.jar \
    -license $CEPAPPLIANCE_LICENSE_PATH \
    -appliance localhost:21761 \
    -adapters adapters.xml \
    schema.xml \
    2>&1 | tee -i ./schema.log


echo "Stopping CEPappliance Emulator."
kill $emulator_pid

# echo "Stopping TAIL"
kill $tail_pid

wait
