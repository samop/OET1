function [V]=PgetV(x,y,QQ,xx,yy);
	eps0=8.854e-12;
	V=0.0;
	for k=1:length(QQ)
		V=V+QQ(k)/sqrt((xx(k)-x)^2+(yy(k)-y)^2);
	endfor
	V=V/(4*pi*eps0);
endfunction
