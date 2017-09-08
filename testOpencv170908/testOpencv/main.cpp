#include "ImageProcess.h"



char* window_name = "crops";
int main(int argc,char** argv)
{
	Mat src = imread("E:\\FirstYear\\MachineVision\\SampleImages\\crops002.jpg", 1);
	namedWindow(window_name, CV_WINDOW_AUTOSIZE);
	if (!src.data)return -1;
	ImageProcess image_process(src);
	image_process.GreyTransform();
	image_process.OTSUBinarize();
	image_process.GetCropRows();
	imshow(window_name, src);
	imshow("grey", image_process.grey_image_);
	imshow("grey", image_process.thresh_image_);
	waitKey(0);
}