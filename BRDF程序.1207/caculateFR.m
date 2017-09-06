function [ FR ] = caculateFR( Leaf_Data,DC,DSP_OK,Data_Class)
%UNTITLED ����ҶƬFR
%   �˴���ʾ��ϸ˵��
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
end

