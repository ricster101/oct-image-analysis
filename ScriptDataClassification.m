% Adriana Costa
% Ricardo Margarido
% June 2017
%
% loading pre obtained .mat files and arranging them for classification

paramsArray = load('paramsArray_bior37_4.mat');
paramsArrayCumulative = load('paramsArrayCumulative_bior37_4.mat');

totalParams = load('bior3.7_4_totalData.mat');

paramsArray = paramsArray.paramsArray;
paramsArrayCumulative = paramsArrayCumulative.paramsArrayCumulative;
totalParams = totalParams.lineDataset;

layers = paramsArray(:,9);

layers1 = find(layers==1);
layers2 = find(layers==2);
layers3 = find(layers==3);


paramsArray_L1 = paramsArray(layers1, :);
paramsArrayCumulative_L1 = paramsArrayCumulative(layers1, :);
totalParams_L1 = totalParams(layers1, :);

paramsArray_L2 = paramsArray(layers2, :);
paramsArrayCumulative_L2 = paramsArrayCumulative(layers2, :);
totalParams_L2 = totalParams(layers2, :);

paramsArray_L3 = paramsArray(layers3, :);
paramsArrayCumulative_L3 = paramsArrayCumulative(layers3, :);
totalParams_L3 = totalParams(layers3, :);