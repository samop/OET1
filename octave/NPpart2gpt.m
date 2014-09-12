function NPpart2gpt(fid,q,x,y,dx,dy,objid)
	overlap=0.15;
	rgbcol=getrgbcol(q);
        fprintf(fid,'set obj %6d rectangle center %10g,%10g size %10g,%10g fc rgb "#%s"\n',objid,x,y,(1+overlap)*dx,(1+overlap)*dy,rgbcol);
endfunction
