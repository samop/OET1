function [NN]=makeNN(bb,aazb,N)
	n=length(bb);
	NN(n)=N;
	S1zpi=bb(n)^2*(1-aazb(n)^2);
	for i=(n-1):-1:1
		NN(i)=round(N*bb(i)^2*(1-aazb(i)^2)/S1zpi);
	endfor
endfunction
