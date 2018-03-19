function [bestParams, error] =errGauss(n,dataX, dataY)
% Adriana Costa
% Ricardo Margarido
% June 2017
%
% errGauss(n,dataX, dataY) 
%
%
% fits that in X and Y to a given number n of gaussians
% using the fminsearchcon function to restrict some values and return the
% lowest error possible

x=zeros(n,3); % Initializing array for Amplitude, Mean and Sigma at 0

for i=1:n %chosing educated guesses for the values
    calc = (find(dataY==max(dataY)))+(0.3*(n-1)*std(dataX));
    x(i,1) = max(dataY)/n; % Amplitude
    x(i,2) = calc(1); % Mean
    x(i,3) = 0.5*n*std(dataX); % Sigma
end

lowerBound = ones(i,3); % Initializing minimum restriction vector
lowerBound(:,1) = 0.1*max(dataY(:)); % Amplitude
lowerBound(:,2) = 1.2*min(dataX(:)); % Mean
lowerBound(:,3) = 0.1*(max(dataX(:)) - min(dataX(:))); % Sigma
upperBound = [3*max(dataY(:)), 0.9*max(dataX(:)), 0.5*(max(dataX(:))-min(dataX(:)))];
% Maximum values that Amplitude, Mean and Sigma can take
ub = repmat (upperBound, i, 1);

fun=@(x)sseval(x,n,dataX,dataY); % Evaluating the error
options = optimset('MaxIter', 1000000, 'MaxFunEvals', 10000000); % Setting maxIterations and Evaluations
[bestParams, error] = fminsearchcon(fun,x,lowerBound, ub,[],[],[], options); % Searching for the best fit and its error

end