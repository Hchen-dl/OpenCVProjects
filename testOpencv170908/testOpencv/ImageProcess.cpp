#include "ImageProcess.h"
#include "math.h"

using namespace cv;
using namespace std;


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
	// size
	int L = 10;
	uchar* p;
	uchar* q;
	uchar* r;
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
	int crop_circle=100;
	RNG rng(12345);
	vector<vector<Point> > contours;
	vector<Vec4i> hierarchy;

	/// 寻找轮廓

	findContours(thresh_image_, contours, hierarchy, CV_RETR_TREE, CV_CHAIN_APPROX_SIMPLE, Point(0, 0));

	/// 对每个找到的轮廓创建可倾斜的边界框和椭圆
	vector<RotatedRect> minRect(contours.size());
	vector<RotatedRect> minEllipse(contours.size());

	for (int i = 0; i < contours.size(); i++)
	{
		minRect[i] = minAreaRect(Mat(contours[i]));
		if (contours[i].size() > 5)
		{
			minEllipse[i] = fitEllipse(Mat(contours[i]));
		}
	}

	/// 绘出轮廓及其可倾斜的边界框和边界椭圆
	Mat drawing = Mat::zeros(thresh_image_.size(), CV_8UC3);
	Point2d pc, p1, p2;
	double line_angle;
	for (int i = 0; i< contours.size(); i++)
	{
		if (arcLength(contours[i], 1) >crop_circle)
		{
			Scalar color = Scalar(rng.uniform(0, 255), rng.uniform(0, 255), rng.uniform(0, 255));
			// contour
			drawContours(drawing, contours, i, color, 1, 8, vector<Vec4i>(), 0, Point());
			// ellipse
			//ellipse(drawing, minEllipse[i], color, 2, 8);
			pc = minEllipse[i].center;
			line_angle = (minEllipse[i].angle+90) / 180 * 3.1415;
			p1.x=pc.x+ minEllipse[i].size.height*0.5*cos(line_angle);
			p1.y= pc.y + minEllipse[i].size.height*0.5*sin(line_angle);
			p2.x = pc.x - minEllipse[i].size.height*0.5*cos(line_angle);
			p2.y = pc.y - minEllipse[i].size.height*0.5*sin(line_angle);
			//ellipse axis;
			line(drawing, p1, p2, color, 1);
			// rotated rectangle
			/*Point2f rect_points[4]; minRect[i].points(rect_points);
			for (int j = 0; j < 4; j++)
				line(drawing, rect_points[j], rect_points[(j + 1) % 4], color, 1, 8);*/
		}		
	}

	/// 结果在窗体中显示
	namedWindow("Contours", CV_WINDOW_AUTOSIZE);
	imshow("Contours", drawing);
}
Vec4i ImageProcess:: LengthenLine(Vec4i line,Mat draw)
{
	cv::Vec4i v = line;
	if (abs(v[2] - v[0]) >abs(v[3] - v[1]))
	{
		line[0] = 0;
		line[1] = ((float)v[1] - v[3]) / (v[0] - v[2]) * -v[0] + v[1];
		line[2] = draw.cols;
		line[3] = ((float)v[1] - v[3]) / (v[0] - v[2]) * (draw.cols - v[2]) + v[3];
	}
	else
	{
		line[0] = ((float)v[0] - v[2]) / (v[1] - v[3]) * -v[1] + v[0];
		line[1] = 0;
		line[2] = ((float)v[0] - v[2]) / (v[1] - v[3])*(draw.rows - v[1]) + v[0];
		line[3] = draw.rows;
	}
	return v;
}
