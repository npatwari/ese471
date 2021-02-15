%
% Provides the value x such that Q(x) == y.
%
function [x] = Qinv(y)

x = sqrt(2) .* erfinv(1-2.*y);