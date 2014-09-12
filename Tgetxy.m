function [x,y]=Tgetxy(ip,jp,n,v,b,x0,y0)
	x=x0+(ip-1)*v/n;
	y=y0+(-0.5*ip+jp-0.5)*(b/n);
endfunction
