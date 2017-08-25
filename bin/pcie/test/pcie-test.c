/**
 * This source file is auto-generated from pcie-test.schema.xml by CEPappliance C-source File Generator null.
 *
 * WARNING: Changes to this file may cause incorrect behavior and will be lost if the file is regenerated.
 */

#include "pcie-test.h"

#include <assert.h>

void cepappliance_pcie_read_callback(cepappliance device, uint64 id, const void* data, size_t size) {
    switch(id) {
    case 3: {
        cepappliance_read_mktdata(device, (const cepappliance_mktdata*) data);
        break;
    }
    default:
        assert(0);
    }
}