/**
 * Copyright 2017 CEPappliance, Inc.
 */

import java.io.PrintStream;
import com.cepappliance.config.fpga.log.*;

/**
 * Adds time difference between two consecuent log messages to the timestamp header of each log message printed to STDOUT.<br>
 * The time diference is formated as [seconds.nonoseconds]. 
 */
public class CustomLogHandlerSTDOUT extends FPGALogHandlerSTDOUT {
    private long lastTimestamp;

    protected void printTimestamp(PrintStream printStream, long timestamp) {
        long diffSecs = (timestamp - lastTimestamp) / 1_000_000_000 % 1000;
        long diffNanosecs = (timestamp - lastTimestamp) % 1_000_000_000;
        printStream.printf("%1$td.%1$tm.%1$tY %1$tH:%1$tM:%1$tS.%2$09d [%3$03d.%4$09d] ",
            timestamp / 1_000_000,
            timestamp % 1_000_000_000,
            diffSecs,
            diffNanosecs
        );
        lastTimestamp = timestamp;
    }
}
