function NPrects2gpt(fn,n,a,b,d,xx,yy,zz,QQ)
	fid=fopen(fn,"w");
	objid=0;
	[nx,nz]=NPgetnxy(n,a,b);
	n2=nx*nz;
	dx=a/nx;
	dz=b/nz;
	Ndumpgptstart(fid,a,3*b,-0.5*a-dx,-1.5*b-dz,+0.5*a+dx,+1.5*b+dz);
	qq=NPQQ2vals(QQ,sqrt(dx*dz));
	objid=0;
	for i=1:n2
		objid=objid+1;
		NPpart2gpt(fid,qq(i),xx(i),zz(i)-b,dx,dz,objid);
	endfor
	for i=(n2+1):(2*n2)
		objid=objid+1;
		NPpart2gpt(fid,qq(i),xx(i),zz(i)+b,dx,dz,objid);
	endfor
	Ndumpgptend(fid,fn);
	fclose(fid);
endfunction
