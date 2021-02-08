% PURPOSE:  Plot an eye diagram of a signal
% License: see LICENSE.md
%
% INPUTS:
%   y_s:    vector of signal samples out of the matched filter
%   N:      the number of samples per symbol.  Assumes that time 0 is 
%           at sample y_s(1).  If not, you must send in an offset integer.
%   offset: the number of samples at the start of y_s to ignore
%
% OUTPUTS:  h, the handle to the lines plotted


function h = plot_eye_diagram(y_s, N, offset)

if ~exist('offset','var'),
    offset = 0;
end

start_indices = (floor(N/2):N:(length(y_s)-N-offset)) + offset;
time_vals     = (0:N)./N - 0.5;

for i=1:length(start_indices),
    h(i) = plot(time_vals, y_s(start_indices(i):start_indices(i)+N), 'b-');
    hold on;
end
set(h,'LineWidth',2)
set(gca,'FontSize',20)
xlabel('Time t/T_s_y')
ylabel('M.F. Output')
hold off;