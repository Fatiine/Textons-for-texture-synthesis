
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
imagesc(T);colormap gray;
title('Texton');

%Texton of periodic component
perT = Texton(Per);
perT=uint8(perT);
PerT = double(perT);
PerT=normalize_image(PerT);
%Afficher Texton
figure(4)
imagesc(PerT);colormap gray;
title('Texton of periodic component');

%  Thresholding
I1=T;
I1(I1<200 & I1>1)=100;
figure(5)
imagesc(I1);colormap gray;
title('Texton thresholding');

% Thresholding
I12=PerT;
I12(I12<200 & I12>1)=100;
figure(6)
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
figure(7)
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
figure(8)
imagesc(b);colormap gray;
title(" synthesize texture after phase randomization of periodic component texton");

% % Display the covariance matric of periodic component
% figure
% imagesc(double(cov(Per)));colormap gray;
% title("Convariance of the periodic component")

% ADSN of original image
figure (9)
d1 = ADSN(a);
imagesc(d1); colormap gray;
title("Asymptotic Discrete Spot Noise");

% ADSN of periodic component
figure(10) 
d2 = ADSN(Per);
imagesc(d2); colormap gray;
title("Asymptotic Discrete Spot Noise of periodic component");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%  COLOR IMAGE TEXTON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load colored imahe 
a1=imread('../data/nuages.jpg');
figure(11)
imshow(a1);
title('Original');

% Periodic component 
per = zeros(size(a1));
per(:,:,1) = per_decomp_smooth(a1(:,:,1));
per(:,:,2) = per_decomp_smooth(a1(:,:,2));
per(:,:,3) = per_decomp_smooth(a1(:,:,3));
per = uint8(per);
figure(12)
imshow(per);
title('Periodic component');

% Texton
figure(13)
alpha=[0.5;0.33;0.17];
col_texton=Col_Texton(a1,alpha);
imshow(col_texton);
title('Color Texton');

% Periodic component Texton
figure(14)
alpha=[0.5;0.33;0.17];
col_texton_per=Col_Texton(per,alpha);
imshow(col_texton_per);
title('Color Texton of the periodic component');

% Randomization
Col_texton=fft2(col_texton);
n=randn(size(col_texton(:,:,1)));
N=fft2(n);

Col_texton(:,:,1)=abs(Col_texton(:,:,1)).*exp(1i*(angle(Col_texton(:,:,1))+angle(N)));
Col_texton(:,:,2)=abs(Col_texton(:,:,2)).*exp(1i*(angle(Col_texton(:,:,2))+angle(N)));
Col_texton(:,:,3)=abs(Col_texton(:,:,3)).*exp(1i*(angle(Col_texton(:,:,3))+angle(N)));

figure(15)
b=uint8(ifft2(Col_texton));
imshow(b);
title(" Texture synthesis after phase randomization");

% Randomization of periodic component
Col_texton_per=fft2(col_texton_per);
n1=randn(size(col_texton_per(:,:,1)));
N1=fft2(n1);

Col_texton_per(:,:,1)=abs(Col_texton_per(:,:,1)).*exp(1i*(angle(Col_texton_per(:,:,1))+angle(N1)));
Col_texton_per(:,:,2)=abs(Col_texton_per(:,:,2)).*exp(1i*(angle(Col_texton_per(:,:,2))+angle(N1)));
Col_texton_per(:,:,3)=abs(Col_texton_per(:,:,3)).*exp(1i*(angle(Col_texton_per(:,:,3))+angle(N1)));

figure(16)
b_per=uint8(ifft2(Col_texton_per));
imshow(b_per);
title(" Texture synthesis after phase randomization of the periodic component texton");
