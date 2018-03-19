function sse = ssevalLOGFinal(x,xdata,ydata)
% Adriana Costa
% Ricardo Margarido
% June 2017
%
% ssevalLOGFinal(x,xdata,ydata)
%
%
%
% ssevalLOGFinal performs the evaluation of the error between the fit at the given
% iteration and the data given to fit
b  = x(1);
m  = x(2);

L  = x(3);
K  = x(4);
ML = x(5);

A  = x(6);
B  = x(7);
MG = x(8);


func = m*xdata + b + L./(1+exp(-K.*(xdata-ML))) + A*exp(-(xdata-MG)./B^2); %+ A1*exp(-(xdata-MG1)./B1^2)+ A2*exp(-(xdata-MG2)./B2^2) + A3*exp(-(xdata-MG3)./B3^2);

sse = sum((ydata - func).^2);


if B > 0.5*max(xdata)
    sse = 10*sse;
end
if K > 2
    sse = 10*sse+2;
end
end