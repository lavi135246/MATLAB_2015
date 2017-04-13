%image will be the first input, and  width and height of cropping are m
function A=mosaic(X,m)
    
img=imread(X);
    
    [h w d]=size(img);
    Hnum=floor(h./m);   %crop
    Wnum=floor(w./m);   %crop
    
    imgnew = zeros(Hnum,Wnum,d);
    a=0:51:255;     %the RGB value to replace
    
    for y=1:m:m*Hnum
        for x=1:m:m*Wnum
            [b1, iMin1] = min(abs(a-mean(mean(img(y:y+m-1,x:x+m-1,1)))));       %find the nearst
            [b2, iMin2] = min(abs(a-mean(mean(img(y:y+m-1,x:x+m-1,2)))));
            [b3, iMin3] = min(abs(a-mean(mean(img(y:y+m-1,x:x+m-1,3)))));
        
            imgnew(y:y+m-1,x:x+m,1)=a(iMin1);
            imgnew(y:y+m-1,x:x+m,2)=a(iMin2);
            imgnew(y:y+m-1,x:x+m,3)=a(iMin3);
        
        end
    end
    
    imgnew=uint8(imgnew);
    figure
    image(imgnew)
    axis off
    axis image
    
    imwrite(imgnew,'HW2.bmp')

end