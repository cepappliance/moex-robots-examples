#!/bin/bash

rm -f log-handler.jar

javac -cp cepappliance-config.jar CustomLogHandlerSTDOUT.java
jar cf log-handler.jar CustomLogHandlerSTDOUT.class
rm -f CustomLogHandlerSTDOUT.class