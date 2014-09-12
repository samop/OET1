function NPcompVmesh(fn, xxT,yyT,zzT,xx,yy,zz,QQ)
	fid=fopen(fn,"w");
	x0=xxT(1);
	for i=1:length(xxT)
		if (abs(xxT(i)-x0)<eps) && (i>1)
			fprintf(fid,'\n');
		endif
		V=NPgetV(xxT(i),yyT(i),zzT(i),QQ,xx,yy,zz);
		fprintf(fid,'%12.7f %12.7f %12.7f %12.7f\n',xxT(i),yyT(i),zzT(i),V);
	endfor
	fclose(fid);
endfunction
