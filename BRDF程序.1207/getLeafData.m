function [ Leaf_data] = getLeafData( Leaf_File,Data_Class )
%GETLEAFDATA �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%global Leaf_Mat_SavePath;
%global Leaf_File_Path;
persistent Temp_Data_Class;
if (strcmp(Leaf_File,pwd))
    warndlg('����ѡ��ҶƬ�����ļ�','����');
    return;
elseif (Leaf_File(end)~='\')
    Leaf_File=[Leaf_File,'\'];
end
Temp_files=dir([Leaf_File,'*.txt']);  %��չ��
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
        return;
        %warndlg('�������ݸ�������,�ļ���ʧ���ظ�','����');        
end
if(Temp_Data_Class~=Data_Class)
    warndlg('ҶƬ������������������������Ͳ�������������','����');
else
    %txt to .mat txt��ȡ������txt��ĿС��10000�ĳ���
    Temp_Leaf_data=[];
    for i = 1:Temp_File_n
        Temp_Leaf_Single_data=load([Leaf_File Temp_files(i).name]);
        Temp_Leaf_data=[Temp_Leaf_data,Temp_Leaf_Single_data(:,2)];
    end
    Leaf_data=Temp_Leaf_data(225:1020,:);
    Leaf_data=Leaf_data';
end
end

