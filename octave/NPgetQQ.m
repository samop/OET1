function [QQ,V1,V2]=NPgetQQ(xx,yy,zz,Ug,a,b,nx,nz)
	nr=length(xx);
	AA=zeros(nr+2);
	bb=zeros(nr+2,1);
	aavg=sqrt(a*b/(nx*nz));
	for i=1:nr
		AA(i,i)=2.97320959825/aavg;
		bb(i)=0.0;
		for j=(i+1):nr
			AA(i,j)=NPgetmmel(xx(i),yy(i),zz(i),xx(j),yy(j),zz(j));
			AA(j,i)=AA(i,j);
		endfor
		if (i<=nr/2)
			AA(i,nr+1)=-1;
			AA(i,nr+2)=0;
		else
			AA(i,nr+1)=0;
			AA(i,nr+2)=-1;
		endif
	endfor
	for j=1:nr
		AA(nr+1,j)=0;
		AA(nr+2,j)=1;
	endfor
	AA(nr+1,nr+1)=1;
	AA(nr+1,nr+2)=-1;
	AA(nr+2,nr+1)=0;
	AA(nr+2,nr+2)=0;
	bb(nr+1)=Ug;
	bb(nr+2)=0.0;
	#AA,bb
	QQ=AA\bb;
	V1=QQ(nr+1);
	V2=QQ(nr+2);
	QQ=QQ(1:nr)*4*pi*8.854e-12;
endfunction
