function [bb]=ordervec(aa,ii)
	for i=1:length(ii)
		bb(length(ii)-i+1)=aa(ii(i));
	endfor
endfunction
