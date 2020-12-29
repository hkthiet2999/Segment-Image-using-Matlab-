% author : 51702187 - Hoang Kien Thiet
%          Nhom 1 - To 2
%
%--------------------------------------------------------------
% Input
I = imread('demo.jpg');
I = rgb2gray (I);
% Cau 01 :
[y , x] = imhist (I);
%--------------------------------------------------------------
% Cau 02:
% Tim Gx su dung built-in function
n = 11; 
a = polyfit(x,y,n);
Gx_cau02 = polyval(a,x);
%--------------------------------------------------------------
% Cau 03:
% Tim Gx su dung my function
Gx_cau03 = myFunc(x,y);
%--------------------------------------------------------------
% Cau 04:
% Ham Gx xap xi Fx voi n = 3 || Gx_n3; a3
a3 = polyfit(x,y,3);
Gx_n3 = polyval(a3,x);

% Ham Gx xap xi Fx voi n = 4 || Gx_n4; a4
a4 = polyfit(x,y,4);
Gx_n4 = polyval(a4,x);

% Ham Gx xap xi Fx voi n = 5 || Gx_n5; a5
a5 = polyfit(x,y,5);
Gx_n5 = polyval(a5,x);

% Ham Gx xap xi Fx voi n = 6 || Gx_n6; a6
a6 = polyfit(x,y,6);
Gx_n6 = polyval(a6,x);

%Tinh sai so :
ss6 = mean(100*(abs((Gx_n6-y)./y)));
ss5 = mean(100*(abs((Gx_n5-y)./y)));
ss4 = mean(100*(abs((Gx_n4-y)./y)));
ss3 = mean(100*(abs((Gx_n3-y)./y)));
% result :
arr_ss = [ss3,ss4,ss5,ss6];
ss_min = min(arr_ss); % Gx_n6
%--------------------------------------------------------------
% Cau 05:
vectoY = Gx_cau02; % Pt (1)
% Cong thuc : j = argmin{ (abs(vectoY'))'};

% Step by step :
% d1 = diff(vectoY);
% abs_Y= abs(diff(vectoY));
% d2 = diff(abs(diff(vectoY)));

result = diff(abs(diff(vectoY)));

[~,index] = sort(result,'ascend');
argmin = index(1:length(index));
j = argmin(1); % Pt (2) - Ket qua can tim cua cau 05

L = max(x); % L  = max (I(:)) = 255
theta = j/(L-1);
% Show ra
Bx = vectoY<=theta; % b(x) can tim
binaryImage = I<=theta;
figure(1)
imshow(binaryImage);
title('Hinh anh phan doan cua anh dau vao');

%--------------------------------------------------------------
% Cau 06 : Chon Gx_n6
% Reshape Fx, Gx_n6:
% Chon n = 11 cho de nhin:
% Tinh lai Fx va Gx_n6 voi n = 11:
[y , x] = imhist (I,11);
a6 = polyfit(x,y,6);
Gx_n6 = polyval(a6,x);
x = reshape(x,[1,11]);
y = reshape(y,[1,11]);
Gx_n6 = reshape(Gx_n6,[1,11]);

% Lam muot do thi Fx
a=y;
[b,c,d]=ncspline(x,a);
xx=0:0.01:256;
yy=splineeval(x,a,b,c,d,xx);
%Lam muot do thi Gx_n6
aGx= Gx_n6;
[bGx,cGx,dGx]=ncspline(x,aGx);
xxGx=0:0.01:256;
yyGx=splineeval(x,aGx,bGx,cGx,dGx,xxGx);
% ------- Plot -------
figure(2)
plot(xx,yy,x,y,'o',xxGx,yyGx);
xlabel('x');
ylabel('y');
title('Do thi ham so G(x) xap xi F(x)');
legend('Do thi ham so F(x)','Toa do cac diem x','Do thi ham so G(x) bac 6');
%--------------------------------------------------------------
% End of Assignment - 51702187 - Hoang Kien Thiet - Nhom 1 To 2