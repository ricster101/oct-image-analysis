function [coef] = coefFunc(imgMatrix, waveletType, waveletLevel)
% Adriana Costa
% Ricardo Margarido
% June 2017
%
% coefFunc(image, waveletType, waveletLevel)
% 
%
% coefFunc gets the wavelet coefs from a grayscale image
% image is the image name as a string ex: 'image.jpg'
% waveletType to chose what wavelet to use ex: 'db4'
% waveletLevel sets the level of decomposition
% see help wavedec2 for more info


%imgMatrix = imread(image);
[cImg, sImg] = wavedec2(imgMatrix, waveletLevel, waveletType);
coef = appcoef2(cImg, sImg, waveletType);
coef = coef(:);

end