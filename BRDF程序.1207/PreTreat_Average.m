function [ data_pretreated ] = PreTreat_Average( data,threshold )
%PRETREAT_AVERAGE ���ݾ�ֵ �޳� ������ֵ �����ݵ�
%   data [in] ����
%   threshold [in] ��ֵ 
%   data_pretreated [out] �������

	data_m=mean(data);
	data_pretreated=[];
	for i=1:length(data(:,1))
        diff=(data(i,:)-data_m);
        cdiff=abs(diff./data_m);
        diffmax=max(cdiff);
        if (max(cdiff)<=threshold )
            data_pretreated=[data_pretreated;data(i,:)];
        end
	end
end

