#pragma once
#ifndef TESTOPENCV170908_TESTOPENCV_IMAGEPROCESS_H_
#define TESTOPENCV170908_TESTOPENCV_IMAGEPROCESS_H_


#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <stdlib.h>
#include <stdio.h>

// mapping from the world coordinates to image coordinates;

// grey level transform
// OTSU binarization 
// main crop's choice
// edge detection

using namespace cv;
class ImageProcess
{
private:
	Mat src_imag_;
	
public:
	Mat grey_image_;
	Mat thresh_image_;
	ImageProcess(Mat src)
	{
		src_imag_ = src;
		cvtColor(src, grey_image_, CV_BGR2GRAY);
	}
	void GreyTransform();
	void OTSUBinarize();
	void DialteImage();
	void GetCropRows();
	Vec4i LengthenLine(Vec4i line, Mat draw);
	void CropSegment();

};

int PreProcess();
#endif // !TESTOPENCV170908_TESTOPENCV_IMAGEPROCESS_H_