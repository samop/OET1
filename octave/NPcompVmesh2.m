function NPcompVmesh2(fn,xxT,yyT,zzT,xx,yy,zz,QQ)
	fid=fopen(fn,"w");
	y0=yyT(1);
	for i=1:length(yyT)
		if (abs(yyT(i)-y0)<eps) && (i>1)
			fprintf(fid,'\n');
		endif
		V=NPgetV(xxT(i),yyT(i),zzT(i),QQ,xx,yy,zz);
		fprintf(fid,'%12.7f %12.7f %12.7f %12.7f\n',xxT(i),yyT(i),zzT(i),V);
	endfor
	fclose(fid);
endfunction
