function [ ] = Plot_xyz( flag,z,dc,v,dt)
%PLOT_XYZ ��ͼ
%   flag [in] ��ͼ���ͣ�0Ϊ��һ����1Ϊ��ͼ��
%   z [in] ��ͼ����
%   dc [in] ��һ��ʱΪ������������ҶƬͼʱΪ���ݷ���(�춥��)
%   �޸�vΪwavelength���º���
%   v [in] ��ֵ�߲���
%   dt[] 
x=[];y=[];
if(flag==0)
    switch dc
        case 7
            for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                for j=pi/18:pi/18:7*pi/18 %�춥�� ÿ��10�Ȳ�һ�� ��7������
                    x=[x 400*sin(j)*cos(i)];
                    y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                end
            end
       case 8
            for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                for j=0:pi/18:7*pi/18 %�춥�� ÿ��10�Ȳ�һ�� ��7������
                    x=[x 400*sin(j)*cos(i)];
                    y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                end
            end
       case 4
            for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                for j=pi*15/180:pi*15/180:6*pi/18 %�춥�� ÿ��10�Ȳ�һ�� ��7������
                    x=[x 400*sin(j)*cos(i)];
                    y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                end
            end
        case 5
            for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                for j=0:pi*15/180:6*pi/18 %�춥�� ÿ��10�Ȳ�һ�� ��7������
                    x=[x 400*sin(j)*cos(i)];
                    y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                end
            end
        otherwise
            errordlg('�������ʹ���','����');
    end
else
    switch dc
        case 0
            if(dt==7)
                for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                    for j=pi/18:pi/18:7*pi/18 %�춥�� ÿ��10�Ȳ�һ�� ��7������
                        x=[x 400*sin(j)*cos(i)];
                        y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                    end
                end
            elseif(dt==4)
                for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                    for j=15*pi/180:pi*15/180:60*pi/180 %�춥�� ÿ��15�Ȳ�һ�� ��4������ 15 30 45 60
                        x=[x 400*sin(j)*cos(i)];
                        y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                    end
                end
            else
                errordlg('�������ʹ���','����');
            end
            
        case {10,30,45}
            if (dt==8)
                for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                    for j=0:pi/18:7*pi/18 %�춥�� ÿ��10�Ȳ�һ�� ��8������
                        x=[x 400*sin(j)*cos(i)];
                        y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                    end
                end
            elseif(dt==4)
                for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                    for j=0*pi/180:pi*15/180:45*pi/180 %�춥�� ÿ��15�Ȳ�һ�� ��4������ 0 15 30 45
                        x=[x 400*sin(j)*cos(i)];
                        y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                    end
                end
            elseif(dt==5)
                for i=0:pi/18:35*pi/18 %��λ�� ÿ��10�Ȳ���һ��
                    for j=0:pi*15/180:6*pi/18 %�춥�� ÿ��15�Ȳ�һ�� ��5������ 0 15 30 45 60
                        x=[x 400*sin(j)*cos(i)];
                        y=[y 400*sin(j)*sin(i)];%x,yֵ����������ֵ
                    end
                end
            else
                errordlg('�������ʹ���','����');
            end  
    end
end
[X,Y]=meshgrid(min(x):max(x),min(y):max(y));
Z = griddata(x,y,z,X,Y);
%Z+ҶƬ�ļ���+����+�Ƕȣ�dt��;

contourf(X,Y,Z,dt);
hold on;
%colormap (gray);
%colorbar;
hold on;

%����
if(dt==7)||(dt==8)
    for i=0:pi/18:7*pi/18
        x1=[];y1=[];
        for j=0:pi/18:2*pi
            x1=[x1 400*sin(i)*cos(j)];
            y1=[y1 400*sin(i)*sin(j)];
        end
        plot(x1,y1,'.k','MarkerSize',4)
        hold on;
        axis equal;
    end
elseif (dt==4)||(dt==5)
    for i=0:pi*15/180:6*pi/18
        x1=[];y1=[];
        for j=0:pi/18:2*pi
            x1=[x1 400*sin(i)*cos(j)];
            y1=[y1 400*sin(i)*sin(j)];
        end
        plot(x1,y1,'.k','MarkerSize',4)
        hold on;
        axis equal;
    end
else
    errordlg('�������ʹ���','����');
end
% 
% 
% 
% % ��������Ȧ
% xr=[];yr=[];
% for m=0:pi/72:2*pi
%     xr=[xr 400*sin(9*pi/18)*cos(m)];
%     yr=[yr 400*sin(9*pi/18)*sin(m)];
% end
% plot(xr,yr,'-k','MarkerSize',10)
% hold on;
% 
% % Բ��ʮ�ֽ�����
% xq=-400*sin(9*pi/18):10:400*sin(9*pi/18);
% yq=zeros(length(xq),1);
% plot(xq,yq,'.k','MarkerSize',4.5);
% hold on;
% plot(yq,xq,'.k','MarkerSize',4.5);
% xq=-400*sin(9*pi/18)*sqrt(2)/2:10:400*sin(9*pi/18)*sqrt(2)/2;
% plot(xq,xq,'.k','MarkerSize',4.5);
% hold on;
% plot(xq,-xq,'.k','MarkerSize',4.5);
% hold on;

%%�������
% if(flag==1)
%     y4=0;x4=-400*sin(dc*pi/180);
%     plot(x4,y4,'p','MarkerFaceColor','r','MarkerSize',16);
%     axis off;
%     hold on;
% end

end

