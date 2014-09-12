function [V]=NPgetV(x,y,z,QQ,xx,yy,zz);
	eps0=8.854e-12;
	V=0.0;
	for k=1:length(QQ)
		d=(xx(k)-x)^2+(yy(k)-y)^2+(zz(k)-z)^2;
		if (d>0.0)
			V=V+QQ(k)/sqrt(d);
		endif
	endfor
	V=V/(4*pi*eps0);
endfunction
