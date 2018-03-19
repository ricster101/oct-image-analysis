%%
% Adriana Costa
% Ricardo Margarido
% June 2017
%
clc, clear all, close all
%% Loading Images Param to Array
current_dir = pwd; % getting directory
files = dir([current_dir '\imgMouse\*.tif']); % getting images

last = size(files,1);

nGauss = 2; % setting number of gaussians

paramsArray = [];
errors = [];
lineDataset = [];


paramsArrayCumulative = [];
errorsCumulative = [];

for i = 1:last
    
    xdata=linspace(1,100);
    ogImg = imread(strcat(files(i).folder,'\',files(i).name)); % reading image
    if (strcmp(files(i).name(1), 'C')) % checking if control
        labeler = 1;
    else
        labeler = 2;
    end
    
    if (strcmp(files(i).name(20) , '1')) % checking layer
        layer = 1;
        
    elseif (strcmp(files(i).name(20) , '2'))
        layer = 2;
        
    elseif (strcmp(files(i).name(20) , '3'))
        layer = 3;
    end
    
    % getting gaussian features
    [params1, error, edgeImg1, countImg1] = gaussParam(nGauss,100,ogImg, 'bior3.7',4);
    errors = [errors error];
    params = [params1(1, 1:3), params1(2, 1:3), i, labeler, layer];
    paramsArray = [paramsArray; params];
    
    % adding gaussians and ploting them
    p = params1;
    
    gt = 0;
    gaussers = zeros(nGauss, 100);
    
    for j = 1:nGauss
        
        aG = p(j,1);
        meanG = p(j,2);
        sdG = p(j,3);
        g1 = aG.*exp(-((edgeImg1-meanG).^2)./(2*sdG.^2));
        gaussers(j,:) = g1;
        gt = gt + g1;
        
    end
    
%     figure
%     subplot 211
%     stem(edgeImg1, countImg1)
%     hold on
%     
%     plot(edgeImg1,gt, 'MarkerSize',30);
%     title(strcat('Histograma da Imagem ', int2str(i)))
%     
%     subplot 212
%     stem(edgeImg1, countImg1)
%     hold on
%     plot(edgeImg1,gaussers(1,:), 'MarkerSize',30);
%     plot(edgeImg1,gaussers(2,:), 'MarkerSize',30);
%     title('Curvas de ajuste')
%     
    
    
    %Cumulative histogram
    [paramsCumulative, errorCumulative, cumulHist, edgeImg] = logParam(100, ogImg, 'bior3.7', 4 );
    lineDataset = [lineDataset; params(1:6), paramsCumulative, params(1,8), params(1,9)];
    
    errorsCumulative = [errorsCumulative errorCumulative];
    paramsCumulative = [paramsCumulative,i, labeler, layer];
    paramsArrayCumulative = [paramsArrayCumulative; paramsCumulative];
    
    
    % ploting the fit
    x = paramsCumulative;
    
    b  = x(1);
    m  = x(2);
    
    L  = x(3);
    K  = x(4);
    ML = x(5);
    
    A  = x(6);
    B  = x(7);
    MG = x(8);
    
    ydata1 = m*xdata+b + L./(1+exp(-K.*(xdata-ML))) + A*exp(-(xdata-MG)./B^2);
%     figure()
%     
%     hold on
%     bar(cumulHist)
%     plot(xdata,ydata1,'g.-', 'MarkerSize',20);
%     
%     plot(xdata, m*xdata+b, 'r.-');
%     plot(xdata, L./(1+exp(-K.*(xdata-ML))), 'r.-');
%     plot(xdata, A*exp(-(xdata-MG)./B^2), 'm*');
%     
%     hold off
%     
%     title(strcat('Histograma Cumulativo da Imagem ', int2str(i)))
%     drawnow;
%     close all
    
end
%close all

test = paramsArray;
