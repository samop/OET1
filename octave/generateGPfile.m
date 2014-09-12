function generateGPfile(filename, datafile, imagefile, VVList, zrange,xlabel, ylabel, Qx=[],Qy=[],QQ=[])
VVList=sort(VVList, "descend");
%zgradimo datoteko s podatki za izris
file_id=fopen(filename,'w');
	fprintf(file_id,'reset\n');
	fprintf(file_id, 'set grid\n');
	fprintf(file_id, 'set size ratio 1\n');	
	fprintf(file_id, 'set format "%%.2f"\n');
	fprintf(file_id, 'set clabel "%%.0f"\n');
	fprintf(file_id, 'set zrange [%.2f:%.2f]\n',zrange(1), zrange(end));
	fprintf(file_id,'set key out title "V [V]:" spacing 1.5\n');
	fprintf(file_id,'set contour base\n');
	fprintf(file_id,'unset surface\n');
	fprintf(file_id,'set isosamples 100,100\n');
	fprintf(file_id, 'set view map\n');
	fprintf(file_id, 'set xlabel "%s"\n',xlabel);
	fprintf(file_id, 'set ylabel "%s"\n',ylabel);
	fprintf(file_id, 'set cntrparam levels discrete  %4.2f',VVList(1));
	for i=VVList(2:end);
		fprintf(file_id, ', %.6f',i);
	end
	fprintf(file_id, '\n');
	fprintf(file_id, 'set terminal png size 1000,800\n');
	fprintf(file_id, 'set output "%s"\n',imagefile);

	for i=1:length(QQ)
	fprintf(file_id, "set object circle at %e,%e size screen 0.002 fc rgb 'black' fs solid 0.8 noborder\n",Qx(i), Qy(i));
	end

	fprintf(file_id, 'splot "%s" using 1:2:6 title '''' w l lw 2\n', datafile);
	fprintf(file_id, "set terminal wxt font 'Verdana,10' persist\n");

	for i=1:length(QQ)
	fprintf(file_id, "set object circle at %e,%e size screen 0.002 fc rgb 'black' fs solid 0.8 noborder\n",Qx(i), Qy(i));
	end
	fprintf(file_id, 'splot "%s" using 1:2:6 title '''' w l lw 2\n',datafile);
fclose(file_id);


end
