RX=randn(2,10);
a=[1 2;2 1];
Rx=a*RX;
u=mean(Rx,2);
Z=cov(Rx');
U=repmat(u,1,10);


[XX,YY]=meshgrid(-1:0,-1:3);
x=zeros(2,10);
for i= 1:10
    for j=1:2
        if j==1
            if rem(i,5)~=0
                x(j,i)=XX(rem(i,5),ceil(i/5));
            else
                x(j,i)=XX(5,ceil(i/5));
            end
        elseif j==2
            if rem(i,5)~=0
                x(j,i)=YY(rem(i,5),ceil(i/5));
            else
                x(j,i)=YY(5,ceil(i/5));
            end
        end
    end    
end

p=1/sqrt((2*pi)^2*length(Z))*exp(-1/2*(x-U)'*inv(Z)*(x-U));

figure

pcolor(p)
hold on

contour(p,5)
colormap(autumn(5))
hold on

plot(Rx(1,:),Rx(2,:),'--gs')
hold on