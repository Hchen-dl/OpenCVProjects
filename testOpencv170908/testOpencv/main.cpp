#include "ImageProcess.h"
#include "GetImage.h"
#include <iostream>

char* window_name = "crops";
bool is_big=false;
using namespace std;

int main(int argc,char** argv)
{
	GetImage get_image;
	get_image.getImage();
	//Mat src = imread("C:\\Users\\ahaiya\\Documents\\FirstYear\\MachineVision\\SampleImages\\crops002.jpg", 1);
	Mat src = get_image.image_;
	namedWindow(window_name, CV_WINDOW_AUTOSIZE);
	//namedWindow("crops", CV_WINDOW_NORMAL);
	//cvResizeWindow(window_name, 500, 500);
	//imshow("crops", src);

	if (!src.data)return -1;
	//Rect rect(src.cols*0.25, src.rows*0.5,src.cols*0.5, src.rows*0.5);
	//if (is_big)src=src(rect);
	ImageProcess image_process(src);
	image_process.GreyTransform();
	image_process.OTSUBinarize();
	////image_process.DialteImage();
	image_process.GetCropRows();

	//imshow(window_name, src);
	//imshow("grey", image_process.grey_image_);
	//imshow("thresh", image_process.thresh_image_);
	//cout<<""<<endl;
	waitKey();
}