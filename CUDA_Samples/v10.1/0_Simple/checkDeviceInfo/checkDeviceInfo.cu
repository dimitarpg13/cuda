#include <cuda_runtime.h>
#include <stdio.h>

int main(int argc, char** argv) {
    printf("%s Starting...\n", argv[0]);

    int deviceCount = 0;
    cudaError_t error_id = cudaGetDeviceCount(&deviceCount);
}