function dumpgptstart(fn,a)
	fid=fopen(fn,"w");
	fprintf(fid,"reset\n");
	fprintf(fid,"unset border\n");
	fprintf(fid,"unset key\n");
	fprintf(fid,"set tics\n");
	fprintf(fid,"set size ratio 1\n");
	fprintf(fid,"set xrange [%f:-%f]\n",a,a);
	fprintf(fid,"set yrange [%f:-%f]\n",a,a);
	fprintf(fid,"\n");
	fprintf(fid,"\n");
	fclose(fid);
endfunction
