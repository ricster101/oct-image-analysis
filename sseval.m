function sse = sseval(x,n,xdata,ydata)
% Adriana Costa
% Ricardo Margarido
% June 2017
%
% sseval(x,n,xdata,ydata)
%
%
%
% sseval performs the evaluation of the error between the fit at the given
% iteration and the data given to fit
func = 0;
for i=1:n
    aG = x(i,1);
    meanG = x(i,2);
    sdG = x(i,3);
    func=func+aG.*exp(-((xdata-meanG).^2)./(2*sdG.^2)); % creating gaussian
end
sse = sum((ydata - func).^2);
end