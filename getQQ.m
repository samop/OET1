function [QQ,xx,yy,zz]=getQQ(fn)
    fid=fopen(fn,"r");
    i=0;
    while !(feof(fid))
        i=i+1;
        line=fscanf(fid,"%g %g %g %g\n",4);
        if length(line)==4
         QQ(i)=line(1);
         xx(i)=line(2);
         yy(i)=line(3);
         zz(i)=line(4);
        endif
    endwhile
    fclose(fid);
endfunction
