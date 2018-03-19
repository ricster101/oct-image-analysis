function [gaussParam3, errorGauss, edgeImg, countImg] = gaussParam(nGauss, nBins, imgMatrix, wave, nLevel)
% Adriana Costa
% Ricardo Margarido
% June 2017
%
% gaussParam(nGauss, nBins, imgMatrix, wave, nLevel)
%
%
%
% gaussParam transforms the imgMatrix to wavelet coef, groups them in
% an histogram and then fits n Gaussians to that histogram
% sorts the given gaussians by area under the curve, importance, and
% returns its features

coef = coefFunc(imgMatrix, wave, nLevel); %getting coef with a given
% wavelet type a specific decomposition level

[countImg, edgeImg] = histcounts(coef, nBins); % grouping coefs in an
% histogram of n bins

edgeImg = edgeImg(:,2:end);

sumCountImg = sum(countImg); % sum to normalize to density
countImg = countImg/sumCountImg; % density of coef


[gaussParam, errorGauss] = errGauss(nGauss,edgeImg, countImg); % getting
% the features corresponding to the fit of Gaussians
gaussParam2 = zeros(1,4);
for i = 1:nGauss
    gaussParam2(i,:) = [gaussParam(i,:), gaussParam(i,1)*gaussParam(i,3)];
    
end

gaussParam3 = sortrows(gaussParam2, -4); % sorting by importance


end