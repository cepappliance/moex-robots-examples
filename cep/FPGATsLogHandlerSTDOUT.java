//package com.cepappliance.config.fpga.log;

import java.io.PrintStream;
import com.cepappliance.config.fpga.log.*;

public class FPGATsLogHandlerSTDOUT extends FPGALogHandlerSTDOUT {
    private long logTs;

    protected void printTimestamp(PrintStream printStream, long timestamp) {
        long diff_sec = (timestamp - logTs) / 1_000_000_000 % 1000;
        long diff_nanosec = (timestamp - logTs) % 1_000_000_000;
        printStream.printf("%1$td.%1$tm.%1$tY %1$tH:%1$tM:%1$tS.%2$09d [%3$03d.%4$09d] ",
            timestamp / 1_000_000,
            timestamp % 1_000_000_000,
            diff_sec,
            diff_nanosec
        );
        logTs = timestamp;
    }
}
