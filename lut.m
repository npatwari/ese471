%
%  PURPOSE: convert input data stream to signal space values for
%     a particular modulation type (as specified by the inputVec 
%     and outputVec).
%  INPUT:   data (groups of bits)
%  OUTPUT:  signal space values
%

function [output] = lut(data, inputVec, outputVec)

if length(inputVec) ~= length(outputVec),
    error('Input and Output vectors must have identical length');
end

% Initialize output
output = zeros(size(data));  

% For each possible data value
for i=1:length(inputVec);      
    % Find the indices where data is equal to that input value
    ind = find(abs(data-inputVec(i)) < eps);
    % Set those indices in the output to be the appropriate output value.
    output(ind) = outputVec(i);
end