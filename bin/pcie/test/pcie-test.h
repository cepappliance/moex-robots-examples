/**
 * This source file is auto-generated from pcie-test.schema.xml by CEPappliance C-source File Generator null.
 *
 * WARNING: Changes to this file may cause incorrect behavior and will be lost if the file is regenerated.
 */

#ifndef __CEPAPPLIANCE_PCIE_TEST_H
#define __CEPAPPLIANCE_PCIE_TEST_H

#include <cepappliance-pcie-adapter.h>

#pragma pack(push, 1)

typedef struct {
    char __cepappliance_alignment[16];
    char side[8];
    float64 price;
    uint64 size;
    char __cepappliance_padding[24];
} cepappliance_order;

// Writes data to 'order' input stream.
inline void cepappliance_write_order(cepappliance device, const cepappliance_order* data) {
    cepappliance_pcie_adapter_write(device, 3, data, sizeof(cepappliance_order));
}

typedef struct {
    struct { struct { float64 price; uint64 size; } buy; struct { float64 price; uint64 size; } sell; } orderbook[15];
    char __cepappliance_padding[16];
} cepappliance_mktdata;

// Callback to receive data from 'mktdata' stream.
// Implementation *must be* provided by the user. 
void cepappliance_read_mktdata(cepappliance device, const cepappliance_mktdata* data);

// Dispatches data received from CEPappliance to the read functions.
// Implementation is auto-generated in pcie-test.c. 
void cepappliance_pcie_read_callback(cepappliance device, uint64 id, const void* data, size_t size);

#pragma pack(pop)

#endif // __CEPAPPLIANCE_PCIE_TEST_H