function [nx,ny]=getnxy(n,a,b)
	if (a<b)
		nx=n;
		ny=nx*round(b/a);
	else
		ny=n;
		nx=ny*round(a/b);
	endif
endfunction
