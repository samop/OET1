function [it,jt]=Tgetitjt(nt)
	it=ceil(sqrt(nt));
	jt=nt-(it-1).^2;
endfunction
