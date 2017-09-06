function [ mat_data ] = LoadMat( mat_name )
%LOADMAT ����mat�ļ�
%   mat_name  [int] mat�ļ�����
%   mat_data   [] mat����

Folder = pwd;

if Folder(end)~='\'
    Folder=[Folder,'\'];
end
mat_full_name=strcat(Folder, mat_name);
if(exist(mat_full_name,'file')==0)
    errordlg(strcat( Folder,' Ŀ¼��',mat_full_name,'������'),'����');
    return;
else
    mat_data=load (mat_full_name);
end

end

