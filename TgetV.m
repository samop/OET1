function [V]=TgetV(x,y,QQ,xxP,yyP,xxT,yyT);
	nP=length(xxP);
	nT=length(xxT);
	eps0=8.854e-12;
	V=0.0;
	for k=1:nP
		V=V+QQ(k)/sqrt((xxP(k)-x)^2+(yyP(k)-y)^2);
	endfor
	for k=(nP+1):(nP+nT)
		V=V+QQ(k)/sqrt((xxT(k-nP)-x)^2+(yyT(k-nP)-y)^2);
	endfor
	V=V/(4*pi*eps0);
endfunction
