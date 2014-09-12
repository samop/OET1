function [QQ,VP,VT,xxP,yyP,xxT,yyT]=Tcompanddump(fn,n,vT,bT,aP,bP,dPT,UPT)
# n: delitev navpicnice trikotnika bT
# vT: dolzina trikotnika, visina, v x smeri
# aP,bP: dolzina in visina pravokotne plosce
# dPT: razdalja med plosco in vrhom trikotnika, ki je pri (0,0)
# UPT: napetost med plosco in trikotnikom
mc=2.97320959825;
	[nxP,nyP]=TgetnxyP(n,bT,aP,bP);
	nP=nxP*nyP;
	nT=n^2;
	SP=aP*bP/(nxP*nyP);
	ST=vT*bT/(2*n^2);
	mmP=mc/sqrt(SP);
	mmT=mc/sqrt(ST);
	[xxP,yyP]=TgetRP(nxP,nyP,aP,bP,-dPT-0.5*aP);
	[xxT,yyT,iip1,iip2,iip3]=TgetRT(n,vT,bT);
	[QQ,VP,VT,AA,bb]=TgetQQ(xxP,yyP,xxT,yyT,mmP,mmT,UPT);
	T2gpt(fn,QQ,n,nT,nP,vT,bT,aP,bP,nxP,nyP,ST,SP,dPT,iip1,iip2,iip3);
%	TgetV(0,0.5*bT,QQ,xxP,yyP,xxT,yyT)
endfunction
