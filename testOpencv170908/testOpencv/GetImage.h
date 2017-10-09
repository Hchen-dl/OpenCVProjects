#pragma once
#ifndef TESTOPENCV170908_TESTOPENCV_GETIMAGE_H_
#define TESTOPENCV170908_TESTOPENCV_GETIMAGE_H_
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <stdlib.h>
#include <stdio.h>
using namespace cv;

class GetImage
{
public:
	Mat image_;
	void getImage();
};
#endif // !TESTOPENCV170908_TESTOPENCV_GETIMAGE_H_
