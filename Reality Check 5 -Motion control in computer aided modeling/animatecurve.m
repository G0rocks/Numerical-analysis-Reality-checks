%xf er fall sem lysir xhniti ferilsins
%yf er fall sem lysir yhniti ferilsins
%s er s
%k er numer a mynd

function animatecurve(xf,yf,s,k)
figure(k)
cla
n=linspace(0,s,10000);

hold on
for i=0:0.01:s
    x=xf(i);
    y=yf(i);
    
    set(gca,'XLim',[0 1],'YLim',[0 1],'Drawmode','fast', 'Visible','on');
    axis square
    cla
    plot(xf(n),yf(n))
    ball = line('color','r','Marker','o','MarkerSize',10, 'LineWidth',2,'erase','xor','xdata',[],'ydata',[]);

    
    set(ball,'xdata',x,'ydata',y);drawnow;pause(0.01)
end