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
            nCC=nCC+1;      %顏色數字
            Q=p;            %起點
            count=0;        %記有幾個
            index=[];       %紀錄有過的index
            xmin=n+1;
            xmax=0;
            ymin=W+1;
            ymax=0;
            while isempty(Q)~=1
                q=Q(1);
                Q(1)=[];    %pop掉第一個
                if im(q)>0 && imL(q)==0
                    count=count+1;		%算是第幾個
                    index(count)=q;		%放index進去
                    i=1;
                    temp=q;
                    imL(q)=nCC;
					
                    if (temp-H)>1 %往左走
                        q(i)=(temp-H);
                        i=i+1;
                    end
                    if (temp+H)<n %往右走
                        q(i)=(temp+H);
                        i=i+1;
                    end
                    if mod(temp,H)>1 && (temp-1)>1 %往上走
                        q(i)=temp-1;
                        i=i+1;
                    end
                    if mod(temp,H)>0 && (temp+1)<n %往下走
                        q(i)=temp+1;
                        i=i+1;
                    end
                    Q=cat(2,Q,q);   %把新的放在後面
					if mod(temp,H) > mod(ymax, H) || mod(temp,H)==0	%找最大最小位置
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
       end 	%while結束
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