function [m]=Tgetmmel(xi,yi,xj,yj)
	d2=(xi-xj)^2+(yi-yj)^2;
	if (d2<eps)
		disp('napaka v getmmel.');
	else
		m=1/sqrt(d2);
	endif
endfunction
