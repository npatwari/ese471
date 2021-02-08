% PURPOSE: insert zeros between samples of the input in order to
%    increase the sampling rate by a factor of OS_Rate
% License: see LICENSE.md


function x_s = upsample(x, OS_Rate)

% Initialize output
len = length(x);
x_s = zeros(1,len*OS_Rate);

% Fill in one out of every OS_Rate samples with the input values
x_s(OS_Rate: OS_Rate: len*OS_Rate) = x;