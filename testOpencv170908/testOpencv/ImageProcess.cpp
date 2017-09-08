#include "ImageProcess.h"


using namespace cv;



int PreProcess()
{
	return 0;
}
void ImageProcess:: GreyTransform()
{
	int channels = src_imag_.channels();
	int n_rows = src_imag_.rows;
	int n_cols = src_imag_.cols;
	if (src_imag_.isContinuous())
	{
		n_cols *= n_rows;
		n_rows = 1;
	}
	int i, j,tem;
	uchar* p;
	uchar* q;
	for (i = 0; i < n_rows; ++i)
	{
		p = src_imag_.ptr<uchar>(i);
		q = grey_image_.ptr<uchar>(i);
		for (j = 0; j < n_cols; ++j)
		{
			tem = p[j * 3 - 1] * 1.8 - p[j * 3] - p[j * 3 - 2];
			if (tem <= 0)
				q[j]=0;
			else
			{
				if (tem> 255)
					q[j] = 255;
				else q[j] = tem;
			}
		}
	}
}
void ImageProcess::OTSUBinarize()
{
	threshold(grey_image_, thresh_image_, 0, 255, CV_THRESH_BINARY | CV_THRESH_OTSU);
}

void ImageProcess::GetCropRows()
{

}
