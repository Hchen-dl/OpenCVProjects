function [ data_wl ] = Wavelength_Set( wavelength,data )
%WAVELENGTH_SET �趨����
%   wavelength [in] ѡ������
%   data [in] ����
%   data_wl [out] �ض�����������

if((wavelength<1000)&&(wavelength>400))
    Temp_x=LoadMat('x.mat');
    x=Temp_x.x;
    for i=1:length(x)
        disp(x(i));
        disp(x(i+1));
        disp(wavelength);
        if ((x(i)-wavelength<=0) && (x(i+1)-wavelength>0))
            data_wl=data(:,i)+(wavelength-x(i))*(data(:,i+1)-data(:,i))./(x(i+1)-x(i));
            break
        end
    end
else
    errordlg('������Χ������400-1000nm��Χ��ѡ��','����');
    data_wl=0;
end

end

