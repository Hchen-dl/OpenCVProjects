function test(Leaf_File_Path)
%����ҶƬ�Ƕȼ����ƶȺͽǶ������ƶ�
%
persistent path_0;
persistent path_30;
persistent path_45;
path_0=strcat(Leaf_File_Path,'\0��\ͼƬ');
path_30=strcat(Leaf_File_Path,'\30��\ͼƬ');
path_45=strcat(Leaf_File_Path,'\45��\ͼƬ');
%��ȡ��ģ����
vector_result1=getModlePictureVector(path_0);
vector_result2=getModlePictureVector(path_30);
vector_result3=getModlePictureVector(path_45);
vector_catagory=[4 5 13 19 23];
vector_meansb=getMeans(vector_result2,vector_catagory);%������������
%% ���ԽǶȼ�����ƶȣ� 
vector_mean1=mean(vector_result1,1);
vector_mean2=mean(vector_result2,1);
vector_mean3=mean(vector_result3,1);
vector_means=[vector_mean1;vector_mean2;vector_mean3];
%��ȡ��������
vector_result1=getSamplePictureVector(path_0);
vector_result2=getSamplePictureVector(path_30);
vector_result3=getSamplePictureVector(path_45);
vector_results=[vector_result1;vector_result2;vector_result3];
I=getClasses(vector_results,vector_means);
I=I';
I_standard=[1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3];%���޸�
I_diff=find(I~=I_standard);
%% ���ԽǶ��ڵ����ƶȣ�
I1=getClasses(vector_result2,vector_meansb);
I1=I1';
I1_standard=[1 1 1 2 2 3 3 3 3 3 3 3 4 4 4 4 4 4 4 5 5 5 ];
I1_diff=find(I1~=I1_standard);
%% ������
fid=fopen('F:\����ʦ��\�ҵ��ļ�\��ҵ����\BRDF����.1207\result.txt','a+');%���޸�
fprintf(fid,'%d\t',I_diff);  
fprintf(fid,'\t�Ƕȼ�\r\n');  
fprintf(fid,'%d\t',I1_diff);  
fprintf(fid,'\t�Ƕ���\r\n');  
fclose(fid);
end

