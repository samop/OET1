function [ix,iy]=TgetixyP(i,nxP,nyP)
	iy=floor((i-1)./nxP)+1;
	ix=i-nxP*(iy-1);
endfunction
