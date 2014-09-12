function [objid]=slices2gpt(fn,qq,rr1,rr2,tt1,tt2,nn,objid0)
    fid=fopen(fn,"a");
    objid=objid0;
    i=sum(nn);
    j=length(nn);
    while (j>0)
        n=nn(j);
        fprintf(fid,"set style fill solid 1.0 border -1\n");
	k=n;
	while (k>0)
                objid=objid+1;
		rgbcol=getrgbcol(qq(i));
                fprintf(fid,"set obj %6d circle at 0,0 size %10g arc [%8.3f:%8.3f] fc rgb '#%s'\n",objid,rr2(i),180*tt1(i)/pi,180*tt2(i)/pi,rgbcol);
		# mali krogec na sredini
                #objid=objid+1;
		#[r,t,x,y]=rrtt2rtxy(rr1(i),rr2(i),tt1(i),tt2(i));
                #fprintf(fid,"set obj %6d circle at %f,%f size 0.01 arc [0:360] fc rgb %s\n",objid,x,y,'"black"');
		k=k-1;
		i=i-1;
        endwhile
        objid=objid+1;
        fprintf(fid,"set obj %6d circle at 0,0 size %10g arc [0:360] fc rgb %s\n",objid,rr1(i+1),'"white"');
	j=j-1;
    endwhile
    fclose(fid);
endfunction
