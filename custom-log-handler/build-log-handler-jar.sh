#!/bin/bash

rm -f ../bin/log-handler.jar

javac -cp ../bin/cepappliance-config.jar CustomLogHandlerSTDOUT.java
jar cf log-handler.jar CustomLogHandlerSTDOUT.class
mv log-handler.jar ../bin/log-handler.jar
rm -f CustomLogHandlerSTDOUT.class