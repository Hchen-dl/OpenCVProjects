   function varargout = BRDF(varargin)
% BRDF MATLAB code for BRDF.fig
%      BRDF, by itself, creates a new BRDF or raises the existing
%      singleton*.
%
%      H = BRDF returns the handle to a new BRDF or the handle to
%      the existing singleton*.
%
%      BRDF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BRDF.M with the given input arguments.
%
%      BRDF('Property','Value',...) creates a new BRDF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BRDF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BRDF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BRDF

% Last Modified by GUIDE v2.5 29-Aug-2017 09:47:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BRDF_OpeningFcn, ...
                   'gui_OutputFcn',  @BRDF_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before BRDF is made visible.
function BRDF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BRDF (see VARARGIN)

% Choose default command line output for BRDF
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BRDF wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Old_FilePath;
global Old_SavePath;
global DSP_File_Path;
global DSP_Mat_SavePath;
global Leaf_File_Path;
global Leaf_Mat_SavePath;
Old_FilePath=pwd;%pwdΪ��ǰ����Ŀ¼��
Old_SavePath=pwd;
DSP_File_Path=pwd;
DSP_Mat_SavePath=pwd;
Leaf_File_Path=pwd;
Leaf_Mat_SavePath=pwd;


% --- Outputs from this function are returned to the command line.
function varargout = BRDF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- �򿪰װ壨Diffuse reflection plate�������ļ�
function DSP_File_Open_Callback(hObject, eventdata, handles)
% hObject    handle to DSP_File_Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DSP_File_Path;
global Old_FilePath;
DSP_File_Path=uigetdir(Old_FilePath);
if(DSP_File_Path~=0)
    Old_FilePath=DSP_File_Path;
    set(handles.InfoText,'string',strcat('�Ѵ�������������ļ�λ�ã�',DSP_File_Path));
else
    warndlg('��ѡ��������������ļ���','����');
end
0
0
0%0 0-0-0-0 ����DSP���ݱ���λ��.
function DSP_Mat_Save_Path_Callback(hObject, eventdata, handles)
% hObject    handle to DSP_Mat_Save_Path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Old_SavePath;
global Old_FilePath;
global DSP_Mat_SavePath;
if(Old_FilePath~=0)
    Old_SavePath=Old_FilePath;
end
DSP_Mat_SavePath = uigetdir(Old_SavePath);
if (DSP_Mat_SavePath~=0)
    Old_SavePath=DSP_Mat_SavePath;
end
set(handles.InfoText,'string',strcat('��ѡ�񱣴������������λ�ã�',DSP_Mat_SavePath));

% --- ��ȡtxt�ļ��е����ݣ��������mat�ļ�
function DSP_2Mat_Callback(hObject, eventdata, handles)
% hObject    handle to DSP_2Mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DSP_Mat_SavePath;
global DSP_File_Path;
global Data_Class;
global DSP_Data;
if (strcmp(DSP_File_Path,pwd))
    errordlg('����ѡ����������ļ�','����');
    return;
elseif (DSP_File_Path(end)~='\')
    DSP_File_Path=[DSP_File_Path,'\'];
    if (DSP_Mat_SavePath==0)
        DSP_Mat_SavePath=DSP_File_Path;
    elseif (DSP_Mat_SavePath(end)~='\')
        DSP_Mat_SavePath=[DSP_Mat_SavePath,'\'];
    end
end
files=dir([DSP_File_Path,'*.txt']);  %��չ��
n=size(files,1);%���Ҫ����txt�ļ�������
switch(n)
    case 154
        Data_Class=4;
    case 190
        Data_Class=5;
    case 262
        Data_Class=7;
    case 298
        Data_Class=8;
    otherwise
        errordlg('�������ݸ�������,�ļ���ʧ���ظ�','����');
        Data_Class=-1;
        return;
end
set(handles.Data_Class_Edit,'string',num2str(Data_Class));

%txt to .mat txt��ȡ������txt��ĿС��10000�ĳ���
Temp_DSP_Data=[];
for i = 1:n
    Temp_DSP_Single_data=load([DSP_File_Path files(i).name]);
    Temp_DSP_Data=[Temp_DSP_Data,Temp_DSP_Single_data(:,2)];
end
DSP_Data=Temp_DSP_Data(225:1020,:);%��ȡ����
DSP_Data=DSP_Data';

DSP_Prefix_Num=DSP_File_Path(length(DSP_File_Path)-3:length(DSP_File_Path)-1);
DSP_Mat_Full_SavePath=strcat(DSP_Mat_SavePath,DSP_Prefix_Num,'.mat');
save (DSP_Mat_Full_SavePath,'DSP_Data');
set(handles.InfoText,'string',strcat('�ѱ��������������Ϊ��',DSP_Mat_Full_SavePath));


% --- �����������ݽ���Ԥ����
function DSP_Pre_Treatment_Callback(hObject, eventdata, handles)
% hObject    handle to DSP_Pre_Treatment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Coefficient=3.0423;
co8=[1	0.9848	0.9397	0.8660	0.7660	0.6429	0.5	0.3420];
co7=[0.9848	0.9397	0.8660	0.7660	0.6429	0.5	0.3420];
co5=[1	0.9659258	0.8660254	0.70710678 0.5];
co4=[0.9659258	0.8660254	0.70710678 0.5];

global DSP_Data;
global DSP_OK;
global Data_Class;
global DC;

switch(Data_Class)
    case 4
        DC=mean(DSP_Data(145:154,:));% DC for Dark_current
        DSP_Choose=zeros(36,length(DSP_Data));
        j=1;
        for i=3:4:144
            DSP_Choose(j,:)=DSP_Data(i,:); 
            j=j+1;
        end
        DSP_PT1=PreTreat_Average(DSP_Choose,0.25);
        DSP_PT2=PreTreat_Average(DSP_PT1,0.15);
        DSP_PTED=mean(DSP_PT2);
        DSP_PTED=repmat(DSP_PTED,36,1);
        DSP_OK=[];
        for i=1:length(DSP_PTED(:,1)) 
            Temp_DSP=((DSP_PTED(i,:)-DC)'*co4)';
            Temp_DSP=Temp_DSP.*Coefficient;
            DSP_OK=[DSP_OK ; Temp_DSP];
        end 
	case 5
        DC=mean(DSP_Data(181:190,:));% DC for Dark_current
        DSP_Choose=zeros(36,length(DSP_Data));
        j=1;
        for i=3:5:144
            DSP_Choose(j,:)=DSP_Data(i,:);  
            j=j+1;
        end
        DSP_PT1=PreTreat_Average(DSP_Choose,0.25);
        DSP_PT2=PreTreat_Average(DSP_PT1,0.15);
        DSP_PTED=mean(DSP_PT2);
        DSP_PTED=repmat(DSP_PTED,36,1);
        DSP_OK=[];
        for i=1:length(DSP_PTED(:,1)) 
            Temp_DSP=((DSP_PTED(i,:)-DC)'*co5)';
            Temp_DSP=Temp_DSP.*Coefficient;
            DSP_OK=[DSP_OK ; Temp_DSP];
        end 
    case 7
        DC=mean(DSP_Data(253:262,:));% DC for Dark_current
        DSP_Choose=zeros(36,length(DSP_Data));
        j=1;
        for i=3:7:252
            DSP_Choose(j,:)=DSP_Data(i,:);  
            j=j+1;
        end
        DSP_PT1=PreTreat_Average(DSP_Choose,0.25);
        DSP_PT2=PreTreat_Average(DSP_PT1,0.15);
        DSP_PTED=mean(DSP_PT2);
        DSP_PTED=repmat(DSP_PTED,36,1);
        DSP_OK=[];
        for i=1:length(DSP_PTED(:,1)) 
            Temp_DSP=((DSP_PTED(i,:)-DC)'*co7)';
            Temp_DSP=Temp_DSP.*Coefficient;
            DSP_OK=[DSP_OK ; Temp_DSP];
        end     
    case 8
        DC=mean(DSP_Data(289:298,:));% DC for Dark_current
        DSP_Choose=zeros(36,length(DSP_Data));
        j=1;
        for i=4:8:288
            DSP_Choose(j,:)=DSP_Data(i,:); 
            j=j+1;
        end
        DSP_PT1=PreTreat_Average(DSP_Choose,0.25);
        DSP_PT2=PreTreat_Average(DSP_PT1,0.15);
        DSP_PTED=mean(DSP_PT2);
        DSP_PTED=repmat(DSP_PTED,36,1);
        DSP_OK=[];
        for i=1:length(DSP_PTED(:,1)) 
            Temp_DSP=((DSP_PTED(i,:)-DC)'*co8)';
            Temp_DSP=Temp_DSP.*Coefficient;
            DSP_OK=[DSP_OK ; Temp_DSP];
        end 
    
end
        Temp_ph=LoadMat('ph.mat');
        ph=Temp_ph.ph;
        for i=1:796        
            DSP_OK(:,i)=DSP_OK(:,i).*ph(i);
        end
set(handles.InfoText,'string','����������ݴ��������');

% --- ��ҶƬ�����ļ�
function Leaf_File_Open_Callback(hObject, eventdata, handles)
% hObject    handle to Leaf_File_Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in Leaf_2Mat.
global Leaf_File_Path;
global Old_FilePath;
Leaf_File_Path=uigetdir(Old_FilePath);
if(Leaf_File_Path~=0)
    Old_FilePath=Leaf_File_Path;
    set(handles.InfoText,'string',strcat('�Ѵ�ҶƬ�����ļ�λ�ã�',Leaf_File_Path));
else
	warndlg('��ѡ��ҶƬ�����ļ���','����');
end

% --- ����ҶƬ���ݱ���λ��.
function Leaf_Mat_Save_Path_Callback(hObject, eventdata, handles)
% hObject    handle to Leaf_Mat_Save_Path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Old_SavePath;
global Old_FilePath;
global Leaf_Mat_SavePath;
if(Old_FilePath~=0)
    Old_SavePath=Old_FilePath;
end
Leaf_Mat_SavePath = uigetdir(Old_SavePath);
if (Leaf_Mat_SavePath~=0)
    Old_SavePath=Leaf_Mat_SavePath;
end
set(handles.InfoText,'string',strcat('��ѡ�񱣴�ҶƬ������λ�ã�',Leaf_Mat_SavePath));

% --- ��ȡtxt�ļ��е����ݣ��������mat�ļ�
function Leaf_2Mat_Callback(hObject, eventdata, handles)
% hObject    handle to Leaf_2Mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Leaf_Mat_SavePath;
global Leaf_File_Path;
global Data_Class;
global Leaf_Data;
if (strcmp(Leaf_File_Path,pwd))
    errordlg('����ѡ��ҶƬ�����ļ�','����');
    return;
elseif (Leaf_File_Path(end)~='\')
    Leaf_File_Path=[Leaf_File_Path,'\'];
end

if (Leaf_Mat_SavePath==0)
    Leaf_Mat_SavePath=Leaf_File_Path;
elseif (Leaf_Mat_SavePath(end)~='\')
    Leaf_Mat_SavePath=[Leaf_Mat_SavePath,'\'];
end
    
Temp_files=dir([Leaf_File_Path,'*.txt']);  %��չ��
Temp_File_n=size(Temp_files,1);%���Ҫ����txt�ļ�������
switch(Temp_File_n)
    case 262
        Temp_Data_Class=7;
    case 298
        Temp_Data_Class=8;
    case 154
        Temp_Data_Class=4;
    case 190
        Temp_Data_Class=5;
    otherwise
        errordlg('�������ݸ�������,�ļ���ʧ���ظ�','����');
        Data_Class=-1;
        return;
end
if(Temp_Data_Class~=Data_Class)
    errordlg('ҶƬ������������������������Ͳ�������������','����');
    return;
else
    %txt to .mat txt��ȡ������txt��ĿС��10000�ĳ���
    Temp_Leaf_Data=[];
    for i = 1:Temp_File_n
        Temp_Leaf_Single_data=load([Leaf_File_Path Temp_files(i).name]);
        Temp_Leaf_Data=[Temp_Leaf_Data,Temp_Leaf_Single_data(:,2)];
    end
    Leaf_Data=Temp_Leaf_Data(225:1020,:);
    Leaf_Data=Leaf_Data';
    
    Leaf_Prefix_Num=Leaf_File_Path(length(Leaf_File_Path)-3:length(Leaf_File_Path)-1);
    Leaf_Mat_Full_SavePath=strcat(Leaf_Mat_SavePath,Leaf_Prefix_Num,'.mat');
    save (Leaf_Mat_Full_SavePath,'Leaf_Data');
    set(handles.InfoText,'string',strcat('�ѱ���ҶƬ����Ϊ��',Leaf_Mat_Full_SavePath));
end

% --- ����FR
function Compute_FR_Callback(hObject, eventdata, handles)
% hObject    handle to Compute_FR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Leaf_Data;
global DSP_OK;
global Data_Class;
global DC
global Leaf_File_Path;
global Leaf_Mat_SavePath;
global FR

if isempty(Leaf_Data)
    warndlg('���ȶ�ȡҶƬ���ݣ����д����ټ���ҶƬFR');
    return;
end
if isempty(DC)
    warndlg('���ȶ�ȡ���������ݣ����д�����ȡ���������ټ���ҶƬFR');
    return;
end
if isempty(DSP_OK)
    warndlg('���ȶ�ȡ���������ݣ�����У�����ټ���ҶƬFR');
    return;
end
switch(Data_Class)
    case 7
        y=Leaf_Data(1:252,:);
    case 8
        y=Leaf_Data(1:288,:);
    case 4
        y=Leaf_Data(1:144,:);
    case 5
        y=Leaf_Data(1:180,:);
    otherwise
        errordlg('�������ݸ�������,�ļ���ʧ���ظ�','����');
        return
end
Temp_fr=bsxfun(@minus,y,DC);
FR=Temp_fr./DSP_OK;

Leaf_Prefix_Num=Leaf_File_Path(length(Leaf_File_Path)-3:length(Leaf_File_Path)-1);
FR_Mat_Full_SavePath=strcat(Leaf_Mat_SavePath,'FR_',Leaf_Prefix_Num,'.mat');
save (FR_Mat_Full_SavePath,'FR');
set(handles.InfoText,'string',strcat('�ѱ���FR���Ϊ��',FR_Mat_Full_SavePath));

function DSP_Normalization_Callback(hObject, eventdata, handles)
% hObject    handle to DSP_Normalization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

co8=[1 0.9848 0.9397 0.8660 0.7660 0.6429 0.5 0.3420];
co7=[0.9848 0.9397 0.8660 0.7660 0.6429 0.5 0.3420];
co5=[1	0.9659258	0.8660254	0.70710678 0.5];
co4=[1  0.9659258	0.8660254	0.70710678];

data_class=get(handles.Data_Class_Edit,'string');
data_class=str2num(data_class);
cla(handles.axes1);
axes(handles.axes1);
hold on;
temp_z0=[];
temp_z1=[];
switch data_class
    case 7
        for i=1:7
            temp_z0=(1.3938*co7(i)-0.2127)/co7(i)*0.992/3.0669;
            temp_z1=[temp_z1 temp_z0];
        end
    case 8
        for i=1:8
            temp_z0=(1.3938*co8(i)-0.2127)/co8(i)*0.992/3.0669;
            temp_z1=[temp_z1 temp_z0];
        end
    case 4
        for i=1:4
            temp_z0=(1.3938*co4(i)-0.2127)/co4(i)*0.992/3.0669;
            temp_z1=[temp_z1 temp_z0];
        end
    case 5
        for i=1:5
            temp_z0=(1.3938*co5(i)-0.2127)/co5(i)*0.992/3.0669;
            temp_z1=[temp_z1 temp_z0];
        end
    otherwise
        errordlg('�������ʹ���','����');
end
v=temp_z1;
z=repmat(temp_z1,1,36);
Plot_xyz( 0,z,data_class,v, data_class);

% --- ����DSPͼ��
function Plot_DSP_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_DSP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global DSP_OK;
global Data_Class;
if (isempty(DSP_OK))
    errordlg('û���ҵ�����������ݣ����ȡ������������ļ����д��������ͼ','����');
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

% ---��ҶƬͼ��
function Plot_FR_Callback(hObject, eventdata, handles)
% hObject    handle to Plot_FR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FR;
global Data_Class;
if (isempty(FR))    
    errordlg('û���ҵ�ҶƬBRDF���ݣ����ȡҶƬ�����ļ����д��������ͼ','����');
else
    Wavelength=get(handles.Wavelength_Edit,'string');
    Wavelength=str2num(Wavelength);
    % for Wavelength=400:1000
    % FR_WL=Wavelength_Set(Wavelength,FR);
    % end
    FR_WL=Wavelength_Set(Wavelength,FR);
end
cla(handles.axes1);
axes(handles.axes1);
hold on;

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
z=FR_WL';
Plot_xyz( 1,z,Light_Zenith_Angle,Wavelength,Data_Class);

% ---����DSP����
function Save_DSP_Callback(hObject, eventdata, handles)
% hObject    handle to Save_DSP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes2 =handles.axes2;
if isempty(axes2)
   errordlg('�װ�����û��ͼ��','����');
end
newFig = figure('numbertitle','off','name','�������');%����ֱ�ӱ���axes2�ϵ�ͼ�������ѣ����Ա������½���figure�е���ͼ
newAxes = copyobj(axes2,newFig);%��axes2�е���ͼ���Ƶ��½���figure��
set(newAxes,'Units','default','Position','default');%����ͼ��ʾ��λ��
colormap (gray);
colorbar;
[filename,pathname] = uiputfile({ '*.jpg','figure type(*.jpg)'}, '����ͼ��');
if isequal(filename,0)||isequal(pathname,0)
    return
else
    fpath=fullfile(pathname,filename);
end
f = getframe(newFig);
f = frame2im(f);
imwrite(f, fpath);
set(handles.InfoText,'string',strcat('�������ͼ���ѱ���λ��',fpath));

% --- ����ҶƬͼ��
function Save_FR_Callback(hObject, eventdata, handles)
% hObject    handle to Save_FR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes1 =handles.axes1; 
if isempty(axes1)
   errordlg('ҶƬ����û��ͼ��','����');
end
newFig = figure('numbertitle','off','Visible','off','name','ҶƬFR');%����ֱ�ӱ���axes1�ϵ�ͼ�������ѣ����Ա������½���figure�е���ͼ
newAxes = copyobj(axes1,newFig); %��axes1�е���ͼ���Ƶ��½���figure��
set(newAxes,'Units','default','Position','default');%����ͼ��ʾ��λ��
%colormap (gray);
%colorbar;
[filename,pathname] = uiputfile({ '*.jpg','figure type(*.jpg)'}, '����ͼ��');
if isequal(filename,0)||isequal(pathname,0)
    return;
else
    fpath=fullfile(pathname,filename);
end
f = getframe(newFig);
f = frame2im(f);
imwrite(f, fpath);
set(handles.InfoText,'string',strcat('ҶƬͼ���ѱ���Ϊ��',fpath));


% --- �򿪹��ڽ���
function About_Button_Callback(hObject, eventdata, handles)
% hObject    handle to About_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about;


% --- ���ͼ��
function Clear_Fig_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_Fig_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes1 =handles.axes1; %ȡ��axes1�ľ��
axes2 =handles.axes2;
button=questdlg('ȷ����յ�ǰͼ��ô��','����ȷ��','Yes','No','No') ;
if strcmp(button,'Yes')
    if ~isempty(axes1)
        cla(axes1,'reset')
    end
    if ~isempty(axes2)
        cla(axes2,'reset')
    end
elseif strcmp(button,'No')
   return;
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1



function Wavelength_Edit_Callback(hObject, eventdata, handles)
% hObject    handle to Wavelength_Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wavelength_Edit as text
%        str2double(get(hObject,'String')) returns contents of Wavelength_Edit as a double


% --- Executes on button press in btn_createImage.
function btn_createImage_Callback(hObject, eventdata, handles)
global DSP_File_Path;
global DSP_Data;
global Data_Class;
global DSP_OK;
global DC;
persistent DSP_File_Path_0;
persistent DSP_File_Path_30;
persistent DSP_File_Path_45;
global Is_Valid;
global IsDefined_Wavelength;
persistent wavelength_str;

global Leaf_File_Path;
persistent Leaf_File;
global Leaf_Data;

global Leaf_FR;
persistent Leaf_Path;
persistent Leaf_Path_0;
persistent Leaf_Path_30;
persistent Leaf_Path_45;
  
DSP_File_Path_0=[DSP_File_Path,'\�װ�0��'];
DSP_File_Path_30=[DSP_File_Path,'\�װ�30��'];
DSP_File_Path_45=[DSP_File_Path,'\�װ�45��'];
Leaf_Path_0=[Leaf_File_Path,'\0��\'];
Leaf_Path_30=[Leaf_File_Path,'\30��\'];
Leaf_Path_45=[Leaf_File_Path,'\45��\'];


%      [DSP_Data,Data_Class]=getWhiteData(DSP_File_Path_0);
%      [DSP_OK,DC]=DSP_Pre_Treatment(DSP_Data,Data_Class);
%      DSP_Normalization(Data_Class);   
     
for Wavelength=401:999
    %clearvars -except Wavelength DSP_File_Path_0 DSP_File_Path_30 DSP_File_Path_45 IsDefined_Wavelength Leaf_File_Path Leaf_Path_0 Leaf_Path_30 Leaf_Path_45 handles;
    %ɾ��֮ǰ���ڵ�ͼ��
     delete(strcat(Leaf_Path_0,'ͼƬ\*.jpg'));
     delete(strcat(Leaf_Path_30,'ͼƬ\*.jpg'));
     delete(strcat(Leaf_Path_45,'ͼƬ\*.jpg'));
     %�Ƿ�ѡ������
     if(IsDefined_Wavelength) 
        Wavelength=get(handles.Wavelength_Edit,'string');
        Wavelength=str2num(Wavelength);
     end
     %�����䴦��
     [DSP_Data,Data_Class]=getWhiteData(DSP_File_Path_0);
     [DSP_OK,DC]=DSP_Pre_Treatment(DSP_Data,Data_Class);
     DSP_Normalization(Data_Class);  
     for index=0:5
         tem_index=num2str(index);
         Leaf_File=strcat(Leaf_Path_0,'Y',tem_index,'-1'); 
         Leaf_Data=getLeafData(Leaf_File,Data_Class);
         Leaf_FR=caculateFR(Leaf_Data,DC,DSP_OK,Data_Class);
         SaveImage(handles,Leaf_FR,Wavelength,Leaf_Path_0,1,tem_index);              
     end 
     %30��
     [DSP_Data,Data_Class]=getWhiteData(DSP_File_Path_30);
     [DSP_OK,DC]=DSP_Pre_Treatment(DSP_Data,Data_Class);
     DSP_Normalization(Data_Class);          
     for index=0:44
         tem_index=num2str(index);
         Leaf_File=strcat(Leaf_Path_30,'Y',tem_index,'-2'); 
         Leaf_Data=getLeafData(Leaf_File,Data_Class);
         Leaf_FR=caculateFR(Leaf_Data,DC,DSP_OK,Data_Class);
         SaveImage(handles,Leaf_FR,Wavelength,Leaf_Path_30,3,tem_index);              
     end     
     %45��
     [DSP_Data,Data_Class]=getWhiteData(DSP_File_Path_45);
     [DSP_OK,DC]=DSP_Pre_Treatment(DSP_Data,Data_Class);
     DSP_Normalization(Data_Class);     
     for index=0:44
         tem_index=num2str(index);
         Leaf_File=strcat(Leaf_Path_45,'Y',tem_index,'-3'); 
         Leaf_Data=getLeafData(Leaf_File,Data_Class);
         Leaf_FR=caculateFR(Leaf_Data,DC,DSP_OK,Data_Class);
         SaveImage(handles,Leaf_FR,Wavelength,Leaf_Path_45,4,tem_index);         
     end  
     wavelength_str=num2str(Wavelength);
     set(handles.InfoText,'string',strcat(wavelength_str,'������ҶƬͼ���ѱ��档'));   
     test(Leaf_File_Path);%����ͼƬ���ƶȲⶨ
     %�ж��Ƿ�ѡ���Զ��岨����
     if(IsDefined_Wavelength)
        return;
     end       
end
     %ҶƬͼƬ����
%      LeafDirs=dir(Leaf_Path_30);
%      
%      for index=1:length(LeafDirs)
%         
%          if(LeafDirs(index).isdir)
%          Leaf_File=strcat(Leaf_Path_30,LeafDirs(index).name);
%          end 
%          Is_Valid=1;
%           try              
%               Leaf_Data=getLeafData(Leaf_File,Data_Class); 
%           catch
%               Is_Valid=0;
%           end
%          if(Is_Valid==0)
%              continue;
%          end
%          Leaf_FR=caculateFR(Leaf_Data,DC,DSP_OK,Data_Class);
%          SaveImage(handles,Leaf_FR,Wavelength,Leaf_Path_0,1,index);
%          
%          
%      end     
     % 30��
% hObject    handle to btn_createImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function InfoText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InfoText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btn_Stop.
function btn_Stop_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% �޸ĺ�ı���ͼ����
function SaveImage(handles,FR,Wavelength,Leaf_Folder,Angle_Value,index)
global Data_Class;
if (isempty(FR))    
    errordlg('û���ҵ�ҶƬBRDF���ݣ����ȡҶƬ�����ļ����д��������ͼ','����');
else
    FR_WL=Wavelength_Set(Wavelength,FR);
end
cla(handles.axes1);
axes(handles.axes1);
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
 axes1 =handles.axes1; 
 if isempty(axes1)
    errordlg('ҶƬ����û��ͼ��','����');
 end
 axis off;
 newFig = figure('numbertitle','off','Visible','off','name','ҶƬFR');%����ֱ�ӱ���axes1�ϵ�ͼ�������ѣ����Ա������½���figure�е���ͼ
 newAxes = copyobj(axes1,newFig); %��axes1�е���ͼ���Ƶ��½���figure��
 set(newAxes,'Units','default','Position','default');%����ͼ��ʾ��λ��,���򽫻ᱣ���ͼƬ����ʾ��ͼƬ��С��һ�£�
 f = getframe(newFig);
 f = frame2im(f);
 wavelength_str=num2str(Wavelength);
 Leaf_Folder=[Leaf_Folder,'ͼƬ\']
 if ~exist(Leaf_Folder)
 mkdir(Leaf_Folder);
 end
 index_str=num2str(index);
 Leaf_Path=strcat(Leaf_Folder,index_str,'_',wavelength_str,'.jpg');%_45��ʾ30�Ƚ�
 imwrite(f,Leaf_Path);
 set(handles.InfoText,'string',strcat('ҶƬͼ���ѱ���Ϊ��',Leaf_Path));



% --- Executes on button press in checkbox_ChooseWave.
function checkbox_ChooseWave_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_ChooseWave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global IsDefined_Wavelength;
if ( get(hObject,'Value') )
IsDefined_Wavelength = 1;
else
IsDefined_Wavelength= 0;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox_ChooseWave
