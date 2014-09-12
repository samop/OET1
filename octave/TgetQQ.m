function [QQ,VP,VT,AA,bb]=TgetQQ(xxP,yyP,xxT,yyT,mmP,mmT,UPT)
# mmP in mmT sta lastna prispevka kvadratkov in trikotnickov
# UPT: napetost med plosco in trikotnikom
	eps0=8.854e-12;
	nP=length(xxP);
	nT=length(xxT);
	AA=zeros(nP+nT+2);
	bb=zeros(nP+nT+2,1);
	# plosca
	for i=1:nP
		AA(i,i)=mmP;
		bb(i)=0.0;
		# s plosco
		for j=(i+1):nP
			AA(i,j)=Tgetmmel(xxP(i),yyP(i),xxP(j),yyP(j));
			AA(j,i)=AA(i,j);
		endfor
		# s trikotnikom
		for j=1:nT
			AA(i,nP+j)=Tgetmmel(xxP(i),yyP(i),xxT(j),yyT(j));
		endfor
		AA(i,nP+nT+1)=-1;
		AA(i,nP+nT+2)=0;
	endfor
	# trikotnik
	for i=1:nT
		AA(nP+i,nP+i)=mmT;
		bb(nP+i)=0.0;
		# s plosco
		for j=1:nP
			AA(nP+i,j)=Tgetmmel(xxT(i),yyT(i),xxP(j),yyP(j));
		endfor
		# s trikotnikom
		for j=(i+1):nT
			AA(nP+i,nP+j)=Tgetmmel(xxT(i),yyT(i),xxT(j),yyT(j));
			AA(nP+j,nP+i)=AA(nP+i,nP+j);
		endfor
		AA(nP+i,nP+nT+1)=0;
		AA(nP+i,nP+nT+2)=-1;
	endfor
	nr=nP+nT;
	for j=1:nr
		AA(nr+1,j)=0;
		AA(nr+2,j)=1;
	endfor
	AA(nr+1,nr+1)=1;
	AA(nr+1,nr+2)=-1;
	AA(nr+2,nr+1)=0;
	AA(nr+2,nr+2)=0;
	bb(nr+1)=UPT;
	bb(nr+2)=0.0;
	#AA,bb
	QQ=AA\bb;
	VP=QQ(nr+1);
	VT=QQ(nr+2);
	QQ=QQ(1:nr)*(2*pi*eps0);
endfunction
