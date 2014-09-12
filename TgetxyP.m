function [x,y]=TgetxyP(ix,iy,nx,ny,ax,ay,x0)
	y0=0.0;
	x=x0+ax*(-0.5+(ix-0.5)/nx);
	y=y0+ay*(-0.5+(iy-0.5)/ny);
endfunction
