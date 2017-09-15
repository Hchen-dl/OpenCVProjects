#include "ImageProcess.h"
#include "GetImage.h"


char* window_name = "crops";
bool is_big=false;

int main(int argc,char** argv)
{
	//GetImage get_image;
	//get_image.getImage();
	//src=get_image.image_;
	Mat src = imread("E:\\FirstYear\\MachineVision\\SampleImages\\crops002.jpg", 1);
	namedWindow(window_name, CV_WINDOW_AUTOSIZE);
	if (!src.data)return -1;
	Rect rect(src.cols*0.25, src.rows*0.5,src.cols*0.5, src.rows*0.5);
	if (is_big)src=src(rect);
	ImageProcess image_process(src);
	image_process.GreyTransform();
	image_process.OTSUBinarize();
	//image_process.DialteImage();
	image_process.GetCropRows();
	imshow(window_name, src);
	imshow("grey", image_process.grey_image_);
	imshow("thresh", image_process.thresh_image_);
	waitKey(0);
}