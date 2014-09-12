function TTs2gpt(fid,q,xx,yy,objid)
# risemo trikotnik kot poligon
	overlap=0.1;
	rgbcol=Tgetrgbcol(q);
        fprintf(fid,'set obj %6d polygon from %10g,%10g to %10g,%10g to %10g,%10g to %10g,%10g\n',objid,xx(1),yy(1),xx(2),yy(2),xx(3),yy(3),xx(1),yy(1));
        fprintf(fid,'set obj %6d fc rgb "#%s" fillstyle solid 1.0 noborder\n',objid,rgbcol);
endfunction
