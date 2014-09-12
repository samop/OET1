function rects2gpt(fn,QQ,a,b,x1,y1,x2,y2,nx,ny)
	fid=fopen(fn,"w");
	objid=0;
	dumpgptstartPlosci(fid,x1-0.5*a,y1-0.5*b,x2+0.5*a,y2+0.5*b);
	n2=nx*ny;
	dx=a/nx;
	dy=b/ny;
	qq=QQ2vals(QQ(1:2*n2),sqrt(dx*dy));
	objid=0;
	for i=1:n2
		[ix,iy]=getixy(i,nx,ny);
		[x,y]=getxy(ix,iy,nx,ny,a,b,x1,y1);
		objid=objid+1;
		part2gpt(fid,qq(i),x,y,dx,dy,objid);
		[x,y]=getxy(ix,iy,nx,ny,a,b,x2,y2);
		objid=objid+1;
		part2gpt(fid,qq(n2+i),x,y,dx,dy,objid);
	endfor
	dumpgptendPlosci(fid,fn);
	fclose(fid);
endfunction
