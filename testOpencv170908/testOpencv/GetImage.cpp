#include "GetImage.h"
#include "ImageProcess.h"
GetImage::GetImage()
{
	VideoCapture capture(0);//如果是笔记本，0打开的是自带的摄像头，1 打开外接的相机
	double rate = 25.0;//视频的帧率
	Size videoSize(1280, 960);
	VideoWriter writer("VideoTest.avi", CV_FOURCC('M', 'J', 'P', 'G'), rate, videoSize);
	//Mat frame;
	while (capture.isOpened())
	{
		capture >> image_;
		writer << image_;
		imshow("video", image_);
		if (waitKey(20) == 27)//27是键盘摁下esc时，计算机接收到的ascii码值
		{
			break;
		}
		//ImageProcess image_process(image_);
	}
}