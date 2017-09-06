
function [ output_args ] = PlotImage( FR,Wavelength,Angle_Value,fpath )
%SAVEIMAGE ����FR����ͼƬ��
%   �˴���ʾ��ϸ˵��
% hObject    handle to Plot_FR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Data_Class;
if (isempty(FR))    
    errordlg('û���ҵ�ҶƬBRDF���ݣ����ȡҶƬ�����ļ����д��������ͼ','����');
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
switch Angle_Value %��Ҫ�޸�global popupmenul
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
%    errordlg('ҶƬ����û��ͼ��','����');
% end
% newFig = figure('numbertitle','off','Visible','off','name','ҶƬFR');%����ֱ�ӱ���axes1�ϵ�ͼ�������ѣ����Ա������½���figure�е���ͼ
% newAxes = copyobj(axes1,newFig); %��axes1�е���ͼ���Ƶ��½���figure��
% set(newAxes,'Units','default','Position','default');%����ͼ��ʾ��λ��
%colormap (gray);
%colorbar;

% f = getframe(gcf.axes1);
% f = frame2im(f);
% Wavelength=num2str(Wavelength);
% Angle_Value=num2str(Angle_Value);
% fpath=strcat(fpath,'_',Wavelength,'_',Angle_Value,'.jpg');
% imwrite(f, fpath);
%set(handles.InfoText,'string',strcat('ҶƬͼ���ѱ���Ϊ��',fpath));
end

