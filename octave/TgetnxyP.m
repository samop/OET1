function [nxP,nyP]=TgetnxyP(nT,b,aP,bP)
	if (aP<bP)
		nxP=ceil(nT*aP/b);
		nyP=nxP*round(bP/aP);
	else
		nyP=ceil(nT*bP/b);
		nxP=nyP*round(aP/bP);
	endif
endfunction
