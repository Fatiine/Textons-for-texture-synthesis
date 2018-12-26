a=imread('../data/wall.png');
a=mean(a,3);
l=Texton(a);
l=uint8(l);
I = double(l);
%Afficher Texton
I=fftshift(I);
I=normalize_image(I);
%imagesc(I);colormap gray;
%Afficher La matrice de covariance de a
%imagesc(cov(a));colormap gray;

%Afficher le composant périodique
[C,s] = per_decomp_smooth(a);
%C = normalize_image(C);

% mydisp = @(x)log10(abs(fftshift(x))+1e-5);
% clf;
% subplot(1,2,1);
% imagesc(mydisp(a));colormap gray;
% title('Original');
% subplot(1,2,2);
% imagesc(mydisp(C));colormap gray;
% title('Periodic layer');

imagesc(C);colormap gray;

