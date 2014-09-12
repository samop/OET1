function T2gpt(fn,QQ,n,nT,nP,vT,bT,aP,bP,nxP,nyP,ST,SP,dPT,iip1,iip2,iip3)
	fid=fopen(fn,"w");
	objid=0;
	x1=1.2*(-dPT-aP);
	y1=-0.6*max(bT,bP);
	x2=1.2*vT;
	y2=-y1;
	Tgptstart(fid,x1,y1,x2,y2);
	dxP=aP/nxP;
	dyP=bP/nyP;
	qq=TQQ2vals(QQ,nP,nT,SP,ST);
	objid=0;
	for i=1:nP
		[ix,iy]=TgetixyP(i,nxP,nyP);
		[x,y]=TgetxyP(ix,iy,nxP,nyP,aP,bP,-dPT-aP/2);
		objid=objid+1;
		TPs2gpt(fid,qq(i),x,y,dxP,dyP,objid);
	endfor
	for k=1:nT
		[ip1,jp1]=Tgetipjp(iip1(k)); [xx(1),yy(1)]=Tgetxy(ip1,jp1,n,vT,bT,0,0);
		[ip2,jp2]=Tgetipjp(iip2(k)); [xx(2),yy(2)]=Tgetxy(ip2,jp2,n,vT,bT,0,0);
		[ip3,jp3]=Tgetipjp(iip3(k)); [xx(3),yy(3)]=Tgetxy(ip3,jp3,n,vT,bT,0,0);
		objid=objid+1;
		TTs2gpt(fid,qq(nP+k),xx,yy,objid);
	endfor
	Tgptend(fid,fn);
	fclose(fid);
endfunction
