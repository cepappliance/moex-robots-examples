#include <stdio.h>
#include <time.h>
#include <limits.h>
#include "pcie-test.h"

clock_t start, end;

void cepappliance_read_mktdata(cepappliance device, const cepappliance_mktdata* data) {
    end = clock();
    // printf("%f\n", data->orderbook[0].buy.price);
}

cepappliance_order order = { .side = "sell", .price = 44.55, .size = 77 };
inline void doWork(cepappliance device) {
    cepappliance_write_order(device, &order);
    cepappliance_pcie_adapter_read(device, cepappliance_pcie_read_callback);
}

int main() {
    cepappliance device = cepappliance_pcie_adapter_open();
    if (!device) {
        fprintf(stderr, "CEPappliance initialization failed\n");
        return -1;
    }

    const unsigned long count = 1000000;
    start = clock();
    for(int i = 0; i < count; ++i) {
        clock();
        clock();
    }
    end = clock();

    double clockLatency = (((double) end - start) / count / CLOCKS_PER_SEC) * 1000000;

    clock_t minLatency = INT_MAX, maxLatency = 0, totalLatency = 0;
    for (int i = 0; i < count; ++i) {
        start = clock();
        doWork(device);
        clock_t latency = end - start;
        if (minLatency > latency) {
            minLatency = latency;
        } else if (maxLatency < latency) {
            maxLatency = latency;
        }
        totalLatency += latency;
        if(i % (count / 100) == 0) {
            fprintf(stdout, ".");
            fflush(stdout);
        }
    }

    cepappliance_pcie_adapter_close(device);

    printf("\n");

    printf("Avg. latency: %f usec.\n", (((double) totalLatency) / count / CLOCKS_PER_SEC) * 1000000 - clockLatency);
    printf("Min  latency: %f usec.\n", (((double) minLatency) / CLOCKS_PER_SEC) * 1000000 - clockLatency);
    printf("Max  latency: %f usec.\n", (((double) maxLatency) / CLOCKS_PER_SEC) * 1000000 - clockLatency);

    return 0;
}
