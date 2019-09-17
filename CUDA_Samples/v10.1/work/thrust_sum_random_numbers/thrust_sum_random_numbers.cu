////////////////////////////////////////////////////////////////////////////
//
// Copyright 1993-2015 NVIDIA Corporation.  All rights reserved.
//
// Please refer to the NVIDIA end user license agreement (EULA) associated
// with this source code for terms and conditions that govern your use of
// this software. Any use, reproduction, disclosure, or distribution of
// this software and related documentation outside the terms of the EULA
// is strictly prohibited.
//
////////////////////////////////////////////////////////////////////////////

/* Template project which demonstrates the basics on how to setup a project
* example application.
* Host code.
*/

#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/generate.h>
#include <thrust/reduce.h>
#include <thrust/functional.h>
#include <algorithm>
#include <cstdlib>

int main(void)
{
	// generate random data serially
	thrust::host_vector<int> h_vec(100);
	std::generate(h_vec.begin(), h_vec.end(), rand);

	// transfer to device and compute sum
	thrust::device_vector<int> d_vec = h_vec;
	int x = thrust::reduce(d_vec.begin(), d_vec.end(), 0, thrust::plus<int>());
	return 0;
}