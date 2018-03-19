function [bestParams, error] =errLogFinal(dataX, dataY)
% Adriana Costa
% Ricardo Margarido
% June 2017
%
% errLogFinal(dataX, dataY)
%
%
% errLogFinal similar to errGauss tries to find the best fit
% of the data in the histogram to a straight line
% a logistic function and a gaussian

x=zeros(1,8);
% Straight Line
x(1) = 0; %b
x(2) = 0; %m  y = m*x+

% Logistic
x(3) = 1; %L
x(4) = 1; %K
x(5) = dataX(end)/4; %ML

% Gaussian
x(6) = 0.2; %A
x(7) = x(4)/4; %B
x(8) = 0.5*(dataX(1) + x(4)); %MG

lowerBound = zeros(1,8);
lowerBound(2) = 0.85;
lowerBound(5) = -1;
lowerBound(8) = -5;
lowerBound(1) = -1;
lowerBound(2)= -1;
%
fun=@(x)ssevalLOGFinal(x,dataX,dataY);
options = optimset('MaxIter', 1000000, 'MaxFunEvals', 100000000);
[bestParams, error] = fminsearchcon(fun,x,lowerBound);
end