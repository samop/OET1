function [ix,iy]=getixy(i,nx,ny)
	iy=floor((i-1)./nx)+1;
	ix=i-nx*(iy-1);
endfunction
