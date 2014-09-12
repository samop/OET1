function loop3D(xx,yy,zz,QQ,xxQ,yyQ,zzQ,fnout)
    fid=fopen(fnout,'w');
    fprintf(fid,"# %12s %12s %12s %12s %12s %12s %12s\n",'x','y','z','Ex','Ey','Ez','V');
    for k=1:length(zz)
    for j=1:length(yy)
        # printf("%d/%d",j,length(yy)); 
        for i=1:length(xx)
            [Ex,Ey,Ez,V]=funcT2EV(xx(i),yy(j),zz(k),QQ,xxQ,yyQ,zzQ);
            fprintf(fid,"%14g %12g %12g %12g %12g %12g %12g\n",xx(i),yy(j),zz(k),Ex,Ey,Ez,V);
        endfor
        # printf("\n");
    endfor
    endfor
    fclose(fid);
endfunction
