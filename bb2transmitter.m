% Bipolar, Baseband PAM transmitter
%
% ESE 471, Spring 2021
% Author: Neal Patwari
% License: see LICENSE.md
%


% Possible modes: 
% 1: 'test' mode which allows you to show what would be tranmitted 
%    for a fake data bit list
% 2: 'instructor', what I use to generate the received signal
% 3: 'assignment', what you use to build a receiver to work with the 
%    given saved received signal.
mode = 2


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Signal Generation
% INPUT:  none
% OUTPUT: binary data
if mode == 2,
    temp      = 'ESE 471';
    data      = text2bits(temp);

else
    data      = [1 0 0 1];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modulation
% INPUT: data
% OUPUT: modulated values, x
inputVec  = [0   1];
outputVec = [-1  1];
x         = lut(data, inputVec, outputVec);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Upsample
% INPUT: modulated values, x
% OUTPUT: modulated values at sampling rate, x_s
x_s       = oversample(x,16);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pulse-shape filter
% INPUT: modulated values at sampling rate, x_s
% OUTPUT: baseband transmit signal s
pulse     = sqrt(1/16).*ones(1,16);
s         = conv(x_s, pulse);

% Plot for project handout
figure(1)
h = plot(s, '-o');
set(gca,'FontSize',20);
set(gca,'ylim',[-0.5 0.5]);
set(h,'LineWidth',2);
xlabel('Sample')
ylabel('Value')
grid



% Load s if doing the receiver assignment from a saved mat file
if mode==3,
   load bb2.mat
end



% Bipolar, baseband PAM receiver

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matched filter
% INPUT: baseband transmitted signal s
% OUTPUT: matched-filtered signal y
y         = filter(pulse, 1, s);


% Plot for project handout
figure(2)
h = plot(y, '-o');
set(gca,'FontSize',20)
set(h,'LineWidth',2);
xlabel('Sample')
ylabel('Value')
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Time Synch
% Input: Matched Filter output
% OUTPUT: Synched MF output with samples at US_Rate, 2*US_Rate, ...
y_s       = y(16:end);

% Plot eye-diagram
figure(3)
h = plot_eye_diagram(y_s, 16, 0);
set(gca,'ylim',[-1.1, 1.1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Downsample
% INPUT: Synched matched filter output
% OUTPUT: Symbol Samples (at n*T_s)
US_Rate   = 16;
r_hat     = y_s(US_Rate: US_Rate: end);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bit decisions
% INPUT: Symbol Samples
% OUTPUT: Bits
data_out = double(r_hat > 0);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translate to ascii text
% INPUT: Bits
% OUTPUT: Character vector, message_out
if mode==3,
    message_out = binvector2str(data_out)
end

