% PURPOSE:  Convert a vector of zeros and ones to a string (char array)
% License: see LICENSE.md
% INPUT:    Expects a row vector of zeros and ones, a multiple of 7 length
%   The most significant bit of each character is always first.
% OUTPUT:   A string

function [str_out] = binvector2str(binvector)

len            = length(binvector);
if (abs(len/7 - round(len/7)) > eps),
    error('Length of bit stream must be a multiple of 7 to convert to a string.');
end

% Each character requires 7 bits in standard ASCII
num_characters = round(len/7);

% Maximum value is first in the vector.  Otherwise would use 0:1:len-1.
bin_values = 2.^(6:-1:0)';  

str_out        = '';  % Initialize character vector
for i=1:num_characters,
    single_char = binvector(((i-1)*7 + 1):i*7);
    str_out(i)  = char(single_char * bin_values);
end
