function [ok]=checkgeom(bb,aazb)
	ok=true;
	for i=1:(length(bb)-1)
		if (bb(i)*aazb(i)<bb(i+1))
			ok=false;
		endif
	endfor
endfunction
