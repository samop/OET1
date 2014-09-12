function [xxP,yyP]=TgetRP(nx,ny,ax,ay,x0)
# x0: sredisce plosce pri -ax/2-dPT
	n2=nx*ny;
	for i=1:n2
		[ix,iy]=TgetixyP(i,nx,ny);
		[xxP(i),yyP(i)]=TgetxyP(ix,iy,nx,ny,ax,ay,x0);
	endfor
endfunction
