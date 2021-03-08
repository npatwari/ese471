% PURPOSE: 
%   Simulate binary PAM bits being transmitted, the value at the receiver 
%   just before the symbol decision, the symbol decision using a threshold,
%   and calculate and plot the number of errors.
%
% INPUTS:
%   The user can change the threshold, the symbol amplitudes a_0 and a_1,
%   the standard deviation of noise, and the probability of H_0.
%
% Author: Neal Patwari, 18 Feb 2019
%         v2 22 Feb 2021
%

threshold =  0.9

% Parameters
a_0 = 0;      % Symbol 0 amplitude (V)
a_1 = 1;      % Symbol 1 amplitude (V)
sigma = 0.4;  % Standard deviation of noise (V)
p_H0 = 0.9;   % Probability of H_0
trials = 1000; % Number of sumbols to simulate

% Simulate trials symbols
actual_symbols = (rand(1,trials) > p_H0);

% Add noise and make decision
RX_value        = zeros(1,trials);
for i = 1:trials
    if actual_symbols(i)
        RX_value(i)    = a_1 + sigma*randn;
    else
        RX_value(i)    = a_0 + sigma*randn;
    end
end
decision_symbol = (RX_value > threshold);
errors = sum(double(xor(decision_symbol, actual_symbols)))

% Plot the results
clf;
figure(1);
hold on;
for i=1:trials
    if actual_symbols(i)
        plot(i,RX_value(i), 'ro');
    else
        plot(i,RX_value(i), 'b*');
    end
end
plot([1,trials],[threshold threshold],'k-')
xlabel('Trial #')
ylabel('Decision Input')
set(gca,'FontSize',20)

figure(2)
h0cases = find(actual_symbols==0);
h1cases = find(actual_symbols);
binedges = -1.5:0.05:2.5;
[nbin0] = hist(RX_value(h0cases), binedges);
[nbin1] = hist(RX_value(h1cases), binedges);
h = plot(binedges, nbin0,'b-*', binedges, nbin1,'r-o');
set(gca,'FontSize',18);
grid('on');
legend('Value | H_0', 'Value | H_1');
ylabel('Occurrances in Bin');
xlabel('Received Symbol Amplitude');