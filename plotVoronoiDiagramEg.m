% Plot an example of symbols in 2d and draw the Voronoi diagram
% Neal Patwari 
% 8 March 2021

%pick M random points in [0,1]^2 space
M = 8;
x = rand(1,M)-0.5;
y = rand(1,M)-0.5;


figure(1);
g = plot(x,y,'bo');
for i=1:length(x)
    pp = text(x(i)-0.01,y(i)+0.04,int2str(i-1), 'FontSize',14)
end
set(gca,'xlim',[-0.5 0.5])
set(gca,'ylim',[-0.5 0.5])
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'xTick',[-0.5:0.25:0.5])
set(gca,'yTick',[-0.5:0.25:0.5])
set(gca,'FontSize',18)
grid('on');
xlabel('Amplitude of \phi_0')
ylabel('Amplitude of \phi_1')
set(g,'MarkerFaceColor','b')
set(g,'MarkerSize',10)


figure(2)
h = voronoi(x,y);
for i=1:length(x)
    pp = text(x(i)-0.01,y(i)+0.04,int2str(i-1), 'FontSize',14)
end
set(gca,'xlim',[-0.5 0.5])
set(gca,'ylim',[-0.5 0.5])
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'xTick',[-0.5:0.25:0.5])
set(gca,'yTick',[-0.5:0.25:0.5])
set(gca,'FontSize',18)
grid('on');
xlabel('Amplitude of \phi_0')
ylabel('Amplitude of \phi_1')
set(h(1),'MarkerFaceColor','b')
set(h(1),'MarkerSize',10)
set(h(1),'Marker','o')
set(h(2),'LineWidth',2)
