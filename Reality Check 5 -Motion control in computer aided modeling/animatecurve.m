%xf er fall sem lysir xhniti ferilsins
%yf er fall sem lysir yhniti ferilsins
%s er s
%k er numer a mynd

function animatecurve(xf,yf,a,b,h,k,c)
figure(k)
cla
n=linspace(a,b,abs(b-a)*10000);
hold on
filename=strcat('figure ', num2str(k),'.gif')
for i=a:h:b
    x=xf(i);
    y=yf(i);
    %set(gca,'XLim',[0 1],'YLim',[0 1],'Drawmode','fast', 'Visible','on');
    set(gca,'XLim',[0 c],'YLim',[0 c], 'SortMethod', 'childorder', 'Visible','on');
    axis square
    cla
    plot(xf(n),yf(n))
    ball = line('color','r','Marker','o','MarkerSize',10, 'LineWidth',2,'xdata',[],'ydata',[]);
    set(ball,'xdata',x,'ydata',y);drawnow;pause(0.01)
          % Capture the plot as an image 
      frame = getframe(figure(k)); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == a
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
end


