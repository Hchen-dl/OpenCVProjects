function [DSP_data,Data_Class] = getWhiteData(DSP_File_Path)
%   ��ȡ�װ�����
%   �˴���ʾ��ϸ˵��
if (strcmp(DSP_File_Path,pwd))
    errordlg('����ѡ����������ļ�','����');
    return;
elseif (DSP_File_Path(end)~='\')
    DSP_File_Path=[DSP_File_Path,'\'];
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
%set(handles.Data_Class_Edit,'string',num2str(Data_Class));
%txt to .mat txt��ȡ������txt��ĿС��10000�ĳ���
Temp_DSP_data=[];
for i = 1:n
    Temp_DSP_Single_data=load([DSP_File_Path files(i).name]);
    Temp_DSP_data=[Temp_DSP_data,Temp_DSP_Single_data(:,2)];
end
DSP_data=Temp_DSP_data(225:1020,:);%��ȡ����
DSP_data=DSP_data';
end

