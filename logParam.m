function [logParam, errorsLog, cumulHist, edgeImg]= logParam(nBins, imgMatrix, wave, nLevel)
% Adriana Costa
% Ricardo Margarido
% June 2017
%
% logParam(nBins, imgMatrix, wave, nLevel)
%
%
%
% logParam transforms the imgMatrix into coefs, groups it in a cumulative
%histogram and finds the best features to fit a curve to it
coef = coefFunc(imgMatrix, wave, nLevel); % getting coefs

[countImg, edgeImg] = histcounts(coef, nBins); % getting the histogram

cumulHist=cumulativeHIST(countImg); % transform the histogram into cumulative
maxCumulHist=max(cumulHist); % for normalization
cumulHist=cumulHist/maxCumulHist;

dataX=linspace(1,nBins);

[logParam, errorsLog] = errLogFinal(dataX,cumulHist); % calulating the features



end