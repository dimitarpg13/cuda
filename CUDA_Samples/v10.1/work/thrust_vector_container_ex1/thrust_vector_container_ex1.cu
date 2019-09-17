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

#include <iostream>

int main(void)
{
	// H has storage for 4 integers
	thrust::host_vector<int> H(4);

	// initialize individual elements
	H[0] = 14;
	H[1] = 20;
	H[2] = 38;
	H[3] = 46;

	// H.size() returns the size of vector H
	std::cout << "H has size " << H.size() << std::endl;

	// print contents of H
	for (int i = 0; i < H.size(); i++)
	{
		std::cout << "H[" << i << "] = " << H[i] << std::endl;
	}

	// resize H
	H.resize(2);

	std::cout << "H now has size " << H.size() << std::endl;

	// Copy host_vector H to device_vector D
	thrust::device_vector<int> D = H;

	// elements of D can be modified
	D[0] = 99;
	D[1] = 88;

	// print contents of D
	for (int i = 0; i < D.size(); i++)
	{
		std::cout << "D[" << i << "] = " << D[i] << std::endl;
	}

	// H and D are automatically destroyed when the function returns
	return 0;
}