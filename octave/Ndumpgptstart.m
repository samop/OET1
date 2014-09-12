function Ndumpgptstart(fid,ax,ay,x1,y1,x2,y2)
	fprintf(fid,"reset\n");
	fprintf(fid,"unset border\n");
	fprintf(fid,"unset key\n");
	fprintf(fid,'set size ratio %f\n',ay/ax);
	fprintf(fid,"unset tics\n");
	fprintf(fid,"set size ratio %f\n",(y2-y1)/(x2-x1));
	fprintf(fid,"set xrange [%f:%f]\n",x1,x2);
	fprintf(fid,"set yrange [%f:%f]\n",y1,y2);
	fprintf(fid,"\n");
	fprintf(fid,"\n");
	fprintf(fid,"set style fill solid 1.0 border 1;\n");
	fprintf(fid,"set style rectangle fillstyle noborder\n");
endfunction
