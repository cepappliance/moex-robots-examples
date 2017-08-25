#ifndef __CEPAPPLIANCE_PCIE_ADAPTER_H_
#define __CEPAPPLIANCE_PCIE_ADAPTER_H_

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

typedef void* cepappliance;

#undef boolean
#undef int08
#undef int16
#undef int32
#undef int64
#undef uint8
#undef uint16
#undef uint32
#undef uint64
#undef float32
#undef float64
#undef timestamp

typedef bool                boolean;
typedef int8_t              int08;
typedef int16_t             int16;
typedef int32_t             int32;
typedef int64_t             int64;
typedef uint8_t             uint08;
typedef uint16_t            uint16;
typedef uint32_t            uint32;
typedef uint64_t            uint64;
typedef uint64_t            money;
typedef float               float32;
typedef double              float64;
typedef uint64_t            timestamp;

cepappliance cepappliance_pcie_adapter_open(void);
void cepappliance_pcie_adapter_close(cepappliance device);

void cepappliance_pcie_adapter_write(cepappliance device, uint64 id, const void* buf, size_t size);

typedef void (*cepappliance_pcie_adapter_read_callback_ptr)(cepappliance device, uint64 id, const void* buf, size_t size);
void cepappliance_pcie_adapter_read(cepappliance device, cepappliance_pcie_adapter_read_callback_ptr callback);

#endif // __CEPAPPLIANCE_PCIE_ADAPTER_H_
