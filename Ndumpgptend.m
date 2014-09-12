function Ndumpgptend(fid,fn)
	fprintf(fid,"\n");
	fprintf(fid,"set term png\n");
	fprintf(fid,"set output ""%s.png""\n",strtok(fn,'.'));
	fprintf(fid,"plot sqrt(-1) w l\n");
endfunction
