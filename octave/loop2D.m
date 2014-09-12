function loop2D(xx,yy,z,QQ,xxQ,yyQ,zzQ,fnout)
    fid=fopen(fnout,'w');
    fprintf(fid,"#(z=%7g) %1s %12s %12s %12s %12s %12s\n",z,'x','y','Ex','Ey','Ez','V');
    for j=1:length(yy)
        # printf("%d/%d",j,length(yy)); 
        for i=1:length(xx)
            [Ex,Ey,Ez,V]=funcT2EV(xx(i),yy(j),z,QQ,xxQ,yyQ,zzQ);
            fprintf(fid,"%14g %12g %12g %12g %12g %12g\n",xx(i),yy(j),Ex,Ey,Ez,V);
        endfor
        fprintf(fid,"\n");
        # printf("\n");
    endfor
    fclose(fid);
endfunction
