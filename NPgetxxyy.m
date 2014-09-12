function [xx,yy]=Pgetxxyy(a,b,x1,y1,x2,y2,nx,ny)
	n2=nx*ny;
	for k=1:n2
		[i,j]=getixy(k,nx,ny);
		[xi,yi]=getxy(i,j,nx,ny,a,b,x1,y1);
		[xj,yj]=getxy(i,j,nx,ny,a,b,x2,y2);
		xx(k)=xi;
		yy(k)=yi;
		xx(n2+k)=xj;
		yy(n2+k)=yj;
	endfor
endfunction
