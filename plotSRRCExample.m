h = SRRC(0.5, 16, 8);

autocor_SRRC = conv(h,h);

figure(1)
g = plot((-8:1/16:8), h,'r-', (-16:1/16:16), ...
         autocor_SRRC,'k-.');
set(gca,'FontSize',20);
set(gca,'ylim',[-0.2 1.1]);
set(gca,'xlim',[-5 5]);
set(gca,'xtick',[-5:1:5])
set(g,'LineWidth',2);
legend('SRRC Pulse','r_p(\tau)')
xlabel('Time t/T_s')
ylabel('Autocorrelation Value')
grid

figure(2)
plot((-12:1/16:4), h,'r-', (-11:1/16:5), h,'r-', (-10:1/16:6), h,'r-',...
    (-9:1/16:7), h,'r-', (-8:1/16:8), h,'r-',...
    (-7:1/16:9), h,'r-', (-6:1/16:10), h,'r-',...
    (-5:1/16:11), h,'r-', (-4:1/16:12), h,'r-');
set(gca,'FontSize',20);
set(gca,'ylim',[-0.1 0.4]);
set(gca,'xlim',[-5 5]);
set(gca,'xtick',[-5:1:5])
set(g,'LineWidth',2);
xlabel('Time t/T_s')
ylabel('Pulses')
grid

figure(3)
plot((-12:1/16:4), -h,'r-', (-11:1/16:5), h,'r-', (-10:1/16:6), h,'r-',...
    (-9:1/16:7), -h,'r-', (-8:1/16:8), -h,'r-',...
    (-7:1/16:9), h,'r-', (-6:1/16:10), h,'r-',...
    (-5:1/16:11), h,'r-', (-4:1/16:12), -h,'r-');
set(gca,'FontSize',20);
set(gca,'ylim',[-0.4 0.4]);
set(gca,'xlim',[-5 5]);
set(gca,'xtick',[-5:1:5])
set(g,'LineWidth',2);
xlabel('Time t/T_s')
ylabel('Modulated Pulses')
grid

figure(4)
h1 = [-h, zeros(1, 8*16)];
h2 = [zeros(1, 1*16), h, zeros(1, 7*16)];
h3 = [zeros(1, 2*16), h, zeros(1, 6*16)];
h4 = [zeros(1, 3*16), -h, zeros(1, 5*16)];
h5 = [zeros(1, 4*16), -h, zeros(1, 4*16)];
h6 = [zeros(1, 5*16), h, zeros(1, 3*16)];
h7 = [zeros(1, 6*16), h, zeros(1, 2*16)];
h8 = [zeros(1, 7*16), h, zeros(1, 1*16)];
h9 = [zeros(1, 8*16), -h];
sumsignal = h1+h2+h3+h4+h5+h6+h7+h8+h9;
plot((-12:1/16:4), -h,'r-', (-11:1/16:5), h,'r-', (-10:1/16:6), h,'r-',...
    (-9:1/16:7), -h,'r-', (-8:1/16:8), -h,'r-',...
    (-7:1/16:9), h,'r-', (-6:1/16:10), h,'r-',...
    (-5:1/16:11), h,'r-', (-4:1/16:12), -h,'r-');
hold on;
l = plot((-12:1/16:12), sumsignal,'b-');
set(gca,'FontSize',20);
set(gca,'ylim',[-0.4 0.4]);
set(gca,'xlim',[-5 5]);
set(gca,'xtick',[-5:1:5])
set(l,'LineWidth',2);
xlabel('Time t/T_s')
ylabel('Modulated Signal s(t)')
grid

filteredRXsignal = conv(sumsignal, h);
figure(5)
m = plot((-12:1/16:12), sumsignal,'b-', ...
    (-20:1/16:20), filteredRXsignal,'k-',...
         (-4:1:4), filteredRXsignal((1:16:129)+16*16), 'ro');
set(gca,'FontSize',20);
set(gca,'ylim',[-1.6 1.6]);
set(gca,'xlim',[-5 5]);
set(gca,'xtick',[-5:1:5])
set(m,'LineWidth',2);
xlabel('Time t/T_s')
ylabel('Received Signals')
legend('Received Signal', 'Filtered by SRRC', 'Samples at nT_s')
grid
