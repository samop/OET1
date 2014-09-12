function [QQ,AA,bb]=getQQPlosci(a,b,x1,y1,x2,y2,nx,ny,Uab)
	n2=nx*ny;
	AA=zeros(2*n2+2);
	bb=zeros(2*n2+2,1);
	aavg=sqrt(a*b/(nx*ny));
	# prva plosca
	for i=1:n2
		AA(i,i)=2.97320959825/aavg;
		bb(i)=0.0;
		[ix,iy]=getixy(i,nx,ny);
		[xi,yi]=getxy(ix,iy,nx,ny,a,b,x1,y1);
		# s prvo plosco
		for j=(i+1):n2
			[jx,jy]=getixy(j,nx,ny);
			[xj,yj]=getxy(jx,jy,nx,ny,a,b,x1,y1);
			AA(i,j)=getmmel(xi,yi,xj,yj);
			AA(j,i)=AA(i,j);
		endfor
		# z drugo plosco
		for j=1:n2
			[jx,jy]=getixy(j,nx,ny);
			[xj,yj]=getxy(jx,jy,nx,ny,a,b,x2,y2);
			AA(i,n2+j)=getmmel(xi,yi,xj,yj);
		endfor
		AA(i,2*n2+1)=-1;
		AA(i,2*n2+2)=0;
	endfor
	# druga plosca
	for i=1:n2
		AA(n2+i,n2+i)=2.97320959825/aavg;	
		bb(n2+i)=0.0;
		[ix,iy]=getixy(i,nx,ny);
		[xi,yi]=getxy(ix,iy,nx,ny,a,b,x2,y2);
		# s prvo plosco
		for j=1:n2
			[jx,jy]=getixy(j,nx,ny);
			[xj,yj]=getxy(jx,jy,nx,ny,a,b,x1,y1);
			AA(n2+i,j)=getmmel(xi,yi,xj,yj);
		endfor
		# z drugo plosco
		for j=(i+1):n2
			[jx,jy]=getixy(j,nx,ny);
			[xj,yj]=getxy(jx,jy,nx,ny,a,b,x2,y2);
			AA(n2+i,n2+j)=getmmel(xi,yi,xj,yj);
			AA(n2+j,n2+i)=AA(n2+i,n2+j);
		endfor
		AA(n2+i,2*n2+1)=0;
		AA(n2+i,2*n2+2)=-1;
	endfor
	nr=2*n2;
	for j=1:nr
		AA(nr+1,j)=0;
		AA(nr+2,j)=1;
	endfor
	AA(nr+1,nr+1)=1;
	AA(nr+1,nr+2)=-1;
	AA(nr+2,nr+1)=0;
	AA(nr+2,nr+2)=0;
	bb(nr+1)=Uab;
	bb(nr+2)=0.0;
	#AA,bb
	QQ=AA\bb;
endfunction
