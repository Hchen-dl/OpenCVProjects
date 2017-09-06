function [ output_args ] = PlotDSP( input_args )
%PLOTDSP 此处显示有关此函数的摘要
%   此处显示详细说明
global DSP_OK;
global Data_Class;
if (isempty(DSP_OK))
    errordlg('没有找到漫反射版数据，请读取漫反射版数据文件进行处理后再作图','错误');
    return;    
else
    Wavelength=get(handles.Wavelength_Edit,'string');
    Wavelength=str2num(Wavelength);
    % for Wavelength=400:1000
    % DSP_WL= Wavelength_Set(Wavelength,DSP_OK);
    %
    %
    % end
    DSP_WL=Wavelength_Set(Wavelength,DSP_OK);
end
cla(handles.axes2);
axes(handles.axes2);
switch get(handles.popupmenu1,'Value')
    case 1
        Light_Zenith_Angle=0;
    case 2
        Light_Zenith_Angle=10;
    case 3
        Light_Zenith_Angle=30;
    case 4
        Light_Zenith_Angle=45;
end
z=DSP_WL';
Plot_xyz( 1,z,Light_Zenith_Angle,Wavelength,Data_Class);

end

