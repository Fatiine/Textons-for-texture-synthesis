
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%  GRAY LEVEL IMAGE   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=imread('../data/wall.png');
% Gray level
a=mean(a,3);
% Display Original image
figure(1)
imagesc(a);colormap gray;
title('Original');

% Display its periodic component
figure(2)
[Per] = per_decomp_smooth(a);
imagesc(Per); colormap gray;
title('Periodic Component');

% Texton of the original image 
t=Texton(a);
t=uint8(t);
T = double(t);
T = normalize_image(T);
% Display 
figure(3)
[m,n]=size(T)
imagesc(T);colormap gray;
title('Texton');

% Texton image support 
t=Texton(a);
t=uint8(t);
T = double(t);
T = normalize_image(T);
% Display 
figure(4)
[m,n]=size(T)
imagesc(T(floor(m/2)-10:floor(m/2)+10,floor(n/2)-8:floor(n/2)+8));colormap gray;
title('Texton Support ');

%Texton of periodic component
perT = Texton(Per);
perT=uint8(perT);
PerT = double(perT);
PerT=normalize_image(PerT);
%Afficher Texton
figure(5)
imagesc(PerT);colormap gray;
title('Texton of periodic component');

%  Thresholding
I1=T;
I1(I1<100 & I1>1)=mean(mean(I1));
figure(6)
imagesc(I1);colormap gray;
title('Texton thresholding');

% Thresholding
I12=PerT;
I12(I12<200 & I12>1)=mean(mean(I12));
figure(7)
imagesc(I12);colormap gray;
title('Periodic Component Texton thresholding');

% Randomization
[M,N]=size(I1);
I2=100*ones(size(I1));
I2(1:M,1:N)=I1;
A=fft2(I2);
n=randn(size(I2));
N=fft2(n);
B=abs(A).*exp(1i*angle(N));
b=real(ifft2(B));
figure(8)
imagesc(b);colormap gray;
title(" synthesize texture after phase randomization");


% Randomization
[M,N]=size(I12);
I22=100*ones(size(I12));
I22(1:M,1:N)=I12;
A=fft2(I22);
n=randn(size(I22));
N=fft2(n);
B=abs(A).*exp(1i*angle(N));
b=real(ifft2(B));
figure(9)
imagesc(b);colormap gray;
title(" synthesize texture after phase randomization of periodic component texton");


% % Display the covariance matric of periodic component
% figure
% imagesc(double(cov(Per)));colormap gray;
% title("Convariance of the periodic component")

% ADSN of original image
figure (10)
d1 = ADSN(a);
imagesc(d1); colormap gray;
title("Asymptotic Discrete Spot Noise");

% ADSN of periodic component
figure(11) 
d2 = ADSN(Per);
imagesc(d2); colormap gray;
title("Asymptotic Discrete Spot Noise of periodic component");

% ADSN of original image texton
figure (100);
d1b = ADSN(T);
imagesc(d1b); colormap gray;
title("Asymptotic Discrete Spot Noise of the texton");

% ADSN of periodic component texton
figure(110) 
d2b = ADSN(PerT);
imagesc(d2b); colormap gray;
title("Asymptotic Discrete Spot Noise of the periodic component texton");

% RPN of original image
figure (12)
r1 = RPN(a);
imagesc(d1); colormap gray;
title("RPN");

% RPN of periodic component
figure(13) 
r2 = RPN(Per);
imagesc(d2); colormap gray;
title("RPN of periodic component");

% RPN of original image texton
figure (120)
r1b = RPN(T);
imagesc(r1b); colormap gray;
title("RPN of texton");

% RPN of periodic component
figure(130) 
r2b = RPN(PerT);
imagesc(r2b); colormap gray;
title("RPN of periodic component texton");

%%%%%%%%%%%%%%%%%%%% Synthesizing Textures With Arbitrary Sizes%%%%%%%%%%%%
% with ADSN
[p1,p2] = size(Per);
PerEx=extend(Per,2*p1,2*p2);
PerExSyth=ADSN(PerEx);
figure(14)
imagesc(PerEx); colormap gray;
title("Extension of periodic component ( "+ string(p1) + " x " + string(p2)+" )=> ( "+ string(2*p1)+ " x " + string(2*p2)+ ")");
figure(15)
imagesc(PerExSyth); colormap gray;
title("ADSN of the extension of periodic component ( "+ string(p1) + " x " + string(p2)+" )=> ( "+ string(2*p1)+ " x " + string(2*p2) + ")");

figure(16)
Per2=Per(1:100,1:100);
PerEx=extend(Per2,2* p1, 2* p2);
PerExSyth=ADSN(PerEx);
imagesc(PerEx); colormap gray;
title("Extension of periodic component ( 20 x 16 ) => ( "+ string(2*p1)+ " x " + string(2*p2)+")");
figure(17)
imagesc(PerExSyth); colormap gray;
title("ADSN of the extension of periodic component ( 20 x 16 ) => ( "+ string(2*p1)+ " x " + string(2*p2) + ")");

% with Texton 
figure(18)
I99=mean(mean(Per))*ones(2* p1, 2* p2);
[M22,N22]=size(Per);
l=floor(2* p1/2);
s=floor(2* p2/2);
L=floor(M22/2);
S=floor(N22/2);
I99(l-L:l+M22-L-1,s-S:s+N22-S-1)=I12;
imagesc(I99);colormap gray;
title("Periodic component texton extension  ");

A=fft2(I99);
n=randn(size(I99));
N=fft2(n);
B=abs(A).*exp(1i*angle(N));
b=real(ifft2(B));
figure(19)
imagesc(b);colormap gray;
title("Synthesizing a large size texture with periodic component texton ");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%  COLOR IMAGE TEXTON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load colored imahe 
a1=imread('../data/textures/c28.png');
figure(20)
imshow(a1);
title('Image originale');

% Periodic component 
per = zeros(size(a1));
per(:,:,1) = per_decomp_smooth(a1(:,:,1));
per(:,:,2) = per_decomp_smooth(a1(:,:,2));
per(:,:,3) = per_decomp_smooth(a1(:,:,3));
per = uint8(per);
figure(21)
imshow(per);
title('Composante périodique');

% Texton
figure(22)
alpha=[0.5;0.33;0.17];
col_texton=Col_Texton(a1,alpha);
imshow(col_texton);
title('Texton');

% Periodic component Texton
figure(23)
alpha=[0.5;0.33;0.17];
col_texton_per=Col_Texton(per,alpha);
imshow(col_texton_per);
title('Texton de la composante périodique');

% Randomization 
Col_texton=fft2(col_texton); 
n=randn(size(col_texton(:,:,1))); 
N=fft2(n); 
Col_texton(:,:,1)=abs(Col_texton(:,:,1)).*exp(1i*(angle(Col_texton(:,:,1))+angle(N))); 
Col_texton(:,:,2)=abs(Col_texton(:,:,2)).*exp(1i*(angle(Col_texton(:,:,2))+angle(N))); 
Col_texton(:,:,3)=abs(Col_texton(:,:,3)).*exp(1i*(angle(Col_texton(:,:,3))+angle(N)));  
figure(24) 
b=uint8(ifft2(Col_texton)); 
imshow(b); 
title(" Synthèse de texture après la randomization de phase du texton"); 

% Randomization of periodic component 
Col_texton_per=fft2(col_texton_per); 
n1=randn(size(col_texton_per(:,:,1))); 
N1=fft2(n1); 
Col_texton_per(:,:,1)=abs(Col_texton_per(:,:,1)).*exp(1i*(angle(Col_texton_per(:,:,1))+angle(N1))); 
Col_texton_per(:,:,2)=abs(Col_texton_per(:,:,2)).*exp(1i*(angle(Col_texton_per(:,:,2))+angle(N1))); 
Col_texton_per(:,:,3)=abs(Col_texton_per(:,:,3)).*exp(1i*(angle(Col_texton_per(:,:,3))+angle(N1))); 
 
figure(25) 
b_per=uint8(ifft2(Col_texton_per)); 
imshow(b_per); 
title(" Synthèse de texture après la randomization de phase du texton de la composante périodique "); 

% RPN of original image
figure (26)
a1_rpn = RPN_color(a1);
a1_rpn=uint8(a1_rpn);
imshow(a1_rpn); 
title("RPN of the original image");

% RPN of periodic component
figure (27)
per_rpn = RPN_color(per);
per_rpn=uint8(per_rpn);
imshow(per_rpn); 
title("RPN of the periodic component ");

% ADSN of original image
figure (28)
d3 = ADSN_color(a1);
imshow(d3);
title("ADSN");

% ADSN of periodic component
figure(29) 
d4 = ADSN_color(per);
imshow(d4);
title("ADSN of periodic component");


% Imagette texton / comparaison avec SOT
figure(30)
m1=mean(mean(per(:,:,1)));
m2=mean(mean(per(:,:,2)));
m3=mean(mean(per(:,:,3)));
[p1,p2,c]=size(per);
I99=ones( p1, p2,c);
I99(:,:,1)=m1*I99(:,:,1);
I99(:,:,2)=m2*I99(:,:,2);
I99(:,:,3)=m3*I99(:,:,3);
l=floor(p1/2);
s=floor(p2/2);
I99(l-30:l+30,s-30:s+30,:)=col_texton(l-30:l+30,s-30:s+30,:);
imshow(uint8(I99));
title('Color Texton Extended');

% Randomization 
Col_texton2=fft2(I99); 
n=randn(size(I99(:,:,1))); 
N=fft2(n); 
Col_texton2(:,:,1)=abs(Col_texton2(:,:,1)).*exp(1i*(angle(Col_texton2(:,:,1))+angle(N))); 
Col_texton2(:,:,2)=abs(Col_texton2(:,:,2)).*exp(1i*(angle(Col_texton2(:,:,2))+angle(N))); 
Col_texton2(:,:,3)=abs(Col_texton2(:,:,3)).*exp(1i*(angle(Col_texton2(:,:,3))+angle(N)));  
figure(31) 
b=uint8(ifft2(Col_texton2)); 
imshow(b); 
title(" Texture synthesis from extended color texton"); 

