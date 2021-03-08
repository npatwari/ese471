% Plot an example of symbols in 2d and draw the Voronoi diagram
% Neal Patwari 
% 8 March 2021

%pick M random points in [0,1]^2 space
M = 8;
x = rand(1,M);
y = rand(1,M);


figure(1);
g = plot(x,y,'bo');
set(gca,'xlim',[0 1])
set(gca,'ylim',[0 1])
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'FontSize',18)
grid('on');
xlabel('Amplitude of \phi_0')
ylabel('Amplitude of \phi_1')
set(g,'MarkerFaceColor','b')
set(g,'MarkerSize',10)


figure(2)
h = voronoi(x,y);
set(gca,'xlim',[0 1])
set(gca,'ylim',[0 1])
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'FontSize',18)
grid('on');
xlabel('Amplitude of \phi_0')
ylabel('Amplitude of \phi_1')
set(h(1),'MarkerFaceColor','b')
set(h(1),'MarkerSize',10)
set(h(1),'Marker','o')
set(h(2),'LineWidth',2)
