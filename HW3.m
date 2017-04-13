function [CC, imL]= cclabel(im)

    [H,W]=size(im);
    imL=zeros(size(im));
    nCC=1;
    n=numel(imL);
	f1='count';	f2='index'; f3='xmin'; f4='xmax'; f5='ymin'; f6='ymax';
	v1=[]; v2=[]; v3=[]; v4=[]; v5=[]; v6=[];
    CC=struct(f1,v1,f2,v2,f3,v3,f4,v4,f5,v5,f6,v6);
    
    for p = 1:n
       if im(p)>0 && imL(p)==0
            nCC=nCC+1;      %�C��Ʀr
            Q=p;            %�_�I
            count=0;        %�O���X��
            index=[];       %�������L��index
            xmin=n+1;
            xmax=0;
            ymin=W+1;
            ymax=0;
            while isempty(Q)~=1
                q=Q(1);
                Q(1)=[];    %pop���Ĥ@��
                if im(q)>0 && imL(q)==0
                    count=count+1;		%��O�ĴX��
                    index(count)=q;		%��index�i�h
                    i=1;
                    temp=q;
                    imL(q)=nCC;
					
                    if (temp-H)>1 %������
                        q(i)=(temp-H);
                        i=i+1;
                    end
                    if (temp+H)<n %���k��
                        q(i)=(temp+H);
                        i=i+1;
                    end
                    if mod(temp,H)>1 && (temp-1)>1 %���W��
                        q(i)=temp-1;
                        i=i+1;
                    end
                    if mod(temp,H)>0 && (temp+1)<n %���U��
                        q(i)=temp+1;
                        i=i+1;
                    end
                    Q=cat(2,Q,q);   %��s����b�᭱
					if mod(temp,H) > mod(ymax, H) || mod(temp,H)==0	%��̤j�̤p��m
						ymax=temp;
					end
					if mod(temp,H) < mod(ymin, H) && mod(temp,H)~=0
						ymin=temp;
					end
					if temp < xmin
						xmin=temp;
					end
					if temp > xmax
						xmax=temp;
					end
                end
                
               
            end
            xmin=ceil(xmin/H);
            xmax=ceil(xmax/H);
            ymin=mod(ymin,H);
            ymax=mod(ymax,H);
            if ymax==0
                ymax=H;
            end
            if ymin==0
                ymin=H;
            end
            CC(nCC).count=count;
            CC(nCC).index=index;
            CC(nCC).xmin=xmin;
            CC(nCC).xmax=xmax;
            CC(nCC).ymin=ymin;
            CC(nCC).ymax=ymax;
       end 	%while����
    end
    
    imL=uint32(imL);
    d1=floor(225/nCC);
    d2=floor(225/(nCC*2));
    d3=floor(225/(nCC+10));
    imnew1=imL*d1;
    imnew2=imL*d2;
    imnew3=imL*d3;
    imnew(:,:,1)=imnew1;
    imnew(:,:,2)=imnew2;
    imnew(:,:,3)=imnew3;
    imnew=uint8(imnew);
	figure
    image(imnew)
    axis off
    axis image
end