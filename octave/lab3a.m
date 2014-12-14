%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Laboratorijska vaja %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% 3. naloga %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%potencial palice V v voltih (V)
V=2000;
%premer palice v m
d=3e-2;

%stevilo kroglic modela palice
N=6;

%koordinati x in z tocke T (v metrih)
x=12e-2;
z=4e-2;


%%%% Seznam ekvipotencialk  (v V) za izris %%%%%%
%Slika 2
VV2=linspace(V/100,V,10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Izracuni -- ne spreminjaj %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf("--------------------- Podatki -----------------------------\n");
dval=N*d;
fprintf("V=%e V\n",V);
fprintf("d=%e m\n",d);
fprintf("N=%d\n",N);
fprintf("dolzina palice 2l=N*d=%e m\n",dval);

y=0;

%fprintf("------- Izracun porazdelitve naboja na kroglicah --------\n");
[QQ,xx,yy,zz,AA,bb]=palica(N,d/2/dval,dval,V);


 fid=fopen('resultQPalica.dat','w');
	for i=1:length(QQ)
		fprintf(fid,'%e %e\n',zz(i), QQ(i));
	end
 fclose(fid);	

%zgradimo datoteko s podatki za izris
file_id=fopen('plotQPalica.gpt','w');
	fprintf(file_id,'reset\n');
	fprintf(file_id,'set grid\n');
	fprintf(file_id,'set yrange [0:*]\n');
	fprintf(file_id,'set xlabel "z [m]";set ylabel "Q [nC]";set format "%%8g"\n');
	fprintf(file_id,'set xtics format "%%.2f"\n');
	fprintf(file_id,'set ytics format "%%.2f"\n');
	fprintf(file_id, 'plot "resultQPalica.dat" using 1:($2)*1e9 title '''' w p pt 3 lw 1\n');
	fprintf(file_id, 'set terminal png size 1000,800\n');
	fprintf(file_id, 'set output "slika_lab3_1_N_%d.png"\n',N);
	fprintf(file_id, 'plot "resultQPalica.dat" using 1:($2)*1e9 title '''' w p pt 3 lw 1\n');

fclose(file_id);

system("gnuplot -p plotQPalica.gpt");
fprintf("------- Izracun kapacitivnosti modela --------\n");
fprintf("C=%e F\n",sum(QQ)/V);

fprintf("------- Izracun elektricnega polja in potenciala v tocki T(x,0,z) --------\n");

%izracunamo in prikazemo elektricno poljsko jakost in potencial v tocki T
[Ex,Ey,Ez,VT]=funcT2EV(x,y,z,QQ,xx,yy,zz);
fprintf("Vektor E(x,z)=(%e, %e) V/m\nPotencial V(x,y)=%e V\n",Ex,Ez,VT);


%fprintf("------------ Izracun polja v okolici modela palice --------------\n");

%izrisemo ekvipotecialke
xxM=linspace(-dval*1.123,dval*1.123,123);
yyM=linspace(-dval*1.123,dval*1.123,123); 
loop2D(xxM,yyM,0,QQ,zz,xx,yy, 'resultDDpalica.dat');

%zgradimo datoteko s podatki za izris
%file_id=fopen('plotDDpalica.gpt','w');
%	fprintf(file_id,'reset\n');
%	fprintf(file_id, 'set grid\n');
%	fprintf(file_id, 'set zrange [000:1600]\n');
%	fprintf(file_id,'set key out title "$V$~[V]:"\n');
%	fprintf(file_id, 'set format "%%.2f"\n');
%	fprintf(file_id,'set contour base\n');
%	fprintf(file_id,'unset surface\n');
%	fprintf(file_id,'set isosamples 100,100\n');
%	fprintf(file_id, 'set view map\n');
%	fprintf(file_id, 'set xlabel "$z$ [m]"\n');
%	fprintf(file_id, 'set ylabel "$x$ [m]"\n');
%	fprintf(file_id, 'set cntrparam levels discrete  ');
%	for i=V:V:5*V
%	fprintf(file_id, '%e, ',i);
%	end
%	fprintf(file_id, '%e \n', 6*V);

%	fprintf(file_id, 'splot "resultDDpalica.dat" using 1:2:6 title '''' w l lw 1\n');
%	fprintf(file_id, 'set terminal png size 1000,800\n');
%	fprintf(file_id, 'set output "slika_lab1_3.png"\n');
%	fprintf(file_id, 'splot "resultDDpalica.dat" using 1:2:6 title '''' w l lw 1\n');

%fclose(file_id);
filename=sprintf("slika_lab3_2_N_%d.png",N);
generateGPfile("plotDDpalica.gpt","resultDDpalica.dat",filename,VV2, [min(VV2),5*max(VV2)], "z [m]","x [m]", xx,yy);




system("gnuplot -p plotDDpalica.gpt");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Konec 3. naloge lab. vaje %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
