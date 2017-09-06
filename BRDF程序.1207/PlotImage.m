
function [ output_args ] = PlotImage( FR,Wavelength,Angle_Value,fpath )
%SAVEIMAGE 根据FR保存图片。
%   此处显示详细说明
% hObject    handle to Plot_FR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_Class;
if (isempty(FR))    
    errordlg('没有找到叶片BRDF数据，请读取叶片数据文件进行处理后再作图','错误');
else
    %Wavelength=get(handles.Wavelength_Edit,'string');
    %Wavelength=str2num(Wavelength);
    % for Wavelength=400:1000
    % FR_WL=Wavelength_Set(Wavelength,FR);
    % end
    FR_WL=Wavelength_Set(Wavelength,FR);
end
%cla(handles.axes1);
%axes(handles.axes1);
hold on;
switch Angle_Value %需要修改global popupmenul
    case 1
        Light_Zenith_Angle=0;
    case 2
        Light_Zenith_Angle=10;
    case 3
        Light_Zenith_Angle=30;
    case 4
        Light_Zenith_Angle=45;
end
z=FR_WL';

Plot_xyz( 1,z,Light_Zenith_Angle,Wavelength,Data_Class);

% axes1 =handles.axes1; 
% if isempty(axes1)
%    errordlg('叶片区域没有图像','错误');
% end
% newFig = figure('numbertitle','off','Visible','off','name','叶片FR');%由于直接保存axes1上的图像有困难，所以保存在新建的figure中的谱图
% newAxes = copyobj(axes1,newFig); %将axes1中的谱图复制到新建的figure中
% set(newAxes,'Units','default','Position','default');%设置图显示的位置
%colormap (gray);
%colorbar;

% f = getframe(gcf.axes1);
% f = frame2im(f);
% Wavelength=num2str(Wavelength);
% Angle_Value=num2str(Angle_Value);
% fpath=strcat(fpath,'_',Wavelength,'_',Angle_Value,'.jpg');
% imwrite(f, fpath);
%set(handles.InfoText,'string',strcat('叶片图像已保存为：',fpath));
end

