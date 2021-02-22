
r = -3:0.01:3;
sigma = 0.5;
sigma2 = sigma^2;
xh0 = exp(-(r+1).^2./(2*sigma2)) / sqrt(2*pi*sigma2);
xh1 = exp(-(r-1).^2./(2*sigma2)) / sqrt(2*pi*sigma2);

figure(1)
h= plot(r, xh0, 'r-', r, xh1, 'b--');

set(h,'LineWidth',2)
set(gca,'FontSize',20)
xlabel('Value of x')
ylabel('Probability Density')
grid('on');


figure(2)
ph0 = 0.75
ph1 = 0.25
g = plot(r, xh0*ph0, 'r-', r, xh1*ph1, 'b--');
set(g,'LineWidth',2)
set(gca,'FontSize',20)
xlabel('Value of x')
ylabel('Probability Density')
grid('on');


figure(3)
f = plot(r, xh1*ph1 - xh0*ph0, 'm-');
set(f,'LineWidth',2)
set(gca,'FontSize',20)
xlabel('Value of x')
ylabel('Probability Density')
grid('on');
