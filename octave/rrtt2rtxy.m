function [r,t,x,y]=rrtt2rtxy(r1,r2,t1,t2)
	if ((abs(t2-t1)>(2*pi-0.001)) & (r1<eps))
		r=0.0;
		t=0.0;
		x=0.0;
		y=0.0;
	else
  	 r=0.5*(r1+r2);
	 t=0.5*(t1+t2);
	 x=r*cos(t);
	 y=r*sin(t);
	endif
endfunction
