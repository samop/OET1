%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Laboratorijska vaja %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% 1. naloga %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%velikosti posameznih nabojev v C
Q1=1e-9;
Q2=-Q1;
Q3=4e-9;

%koordinati naboja Q1 v m
x1=4e-2;
y1=4e-2;

%koordinati naboja Q2 v m
x2=6e-2;
y2=6e-2;

%koordinati naboja Q3 v m
x3=3e-2;
y3=5e-2;

%koordinati tocke T(x,y) v m
x=5e-2;
y=1.5e-2;

%%%% Seznam ekvipotencialk  (v V) za izris %%%%%%
%Slika 1 -- trije naboji
VV1=[-3200 -16000 -8000 -4000 -2500 -1800 -1500 -1200 -1000 -800 -500 -200 -100 0 10 20 50 100 200 500 800 1000 1200 1500 1800 2500 4000 8000 16000 32000];
%Slika 2 -- samo naboja Q1 in Q2
VV2=[-32000, -16000, -8000, -4000, -2500, -1800, -1500, -1200, -1000,-800,-500,-200,-100,-50, -20, -10, 0, 10, 20,50, 100, 200, 500, 800, 1000, 1200, 1500, 1800, 2500, 4000, 8000,16000, 32000];
%Slika 3 -- naboja Q1 in -Q1/2 (seznamu bo avtomatsko dodana ekvipotencialka V=0 in ekvipotencialka ki gre skozi tocko E=0
VV3=[80];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Izracuni -- ne spreminjaj %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf("--------------------- Podatki -----------------------------\n");
fprintf("Q1=%e C v tocki (%e,%e) m\n",Q1,x1,y1);
fprintf("Q2=%e C v tocki (%e,%e) m\n",Q2,x2,y2);
fprintf("Q3=%e C v tocki (%e,%e) m\n",Q3,x3,y3);
fprintf("\nTocka T(x,y)=(%e,%e) m\n",x,y);

fprintf("------------ Izracun geometrije s tremi naboji -----------------\n");
QQ=[Q1,Q2,Q3];
xx=[x1,x2,x3];
yy=[y1,y2,y3];
zz=[0,0,0];
z=0;

%izracunamo in prikazemo elektricno poljsko jakost in potencial v tocki T
[Ex,Ey,Ez,V]=funcT2EV(x,y,z,QQ,xx,yy,zz);
fprintf("Vektor E(x,y)=(%e, %e) V/m\nPotencial V(x,y)=%e V\n",Ex,Ey,V);

%izrisemo ekvipotecialke
xxM=linspace(-1.1e-2,9.1e-2,91);
yyM=linspace(-1.1e-2,9.1e-2,91); 
loop2D(xxM,yyM,0,QQ,xx,yy,zz, 'result3Q.dat');

%zgradimo datoteko s podatki za izris
generateGPfile("plotV3Q.gpt","result3Q.dat","slika_lab1_1.png",VV1, [min(VV1),max(VV1)], "x [m]","y [m]", xx,yy,QQ);

system("gnuplot -p plotV3Q.gpt");

%izracunamo in prikazemo elektricno poljsko jakost in potencial v tocki T pri
%Q3=0
fprintf("------------ Izracun polja na polovici zveznice -----------------\n");
Q3=0;
QQ=[Q1,Q2];
xx=[x1,x2];
yy=[y1,y2];
zz=[0,0,0];

x=(x1+x2)/2;
y=(y1+y2)/2;

[Ex,Ey,Ez,V]=funcT2EV(x,y,z,QQ,xx,yy,zz);
fprintf("Koordinati tocke polovice zveznice: (x',y')=(%e, %e) m\n", x,y);
fprintf("Vektor E=(%e, %e) V/m\nPotencial V=%e V\n",Ex,Ey,V);

%izrisemo ekvipotecialke
loop2D(xxM,yyM,0,QQ,xx,yy,zz, 'result2Qa.dat');

%zgradimo datoteko s podatki za izris
generateGPfile("plotV2Qa.gpt","result2Qa.dat","slika_lab1_2.png",VV2, [min(VV2),max(VV2)], "x [m]","y [m]", xx,yy, QQ);

system("gnuplot -p plotV2Qa.gpt");


%izracun in prikaz polja pri Q1,-Q1/2
fprintf("--- Izracun podatkov za izris polja pri Q1, -Q1/2 nabojih ---\n");
Q3=0;
Q2=-Q1/2;
QQ=[Q1,Q2];

%[Ex,Ey,Ez,V]=funcT2EV(x,y,z,QQ,xx,yy,zz);
%fprintf("Vektor E(x,y)=(%e, %e) V/m\nPotencial V(x,y)=%e V\n",Ex,Ey,V);

%izrisemo ekvipotencialke

xxM=linspace(-25.1e-2,30.1e-2,151);  %povecamo tocnost mreze, da dobimo lepsi izris!
yyM=linspace(-25.1e-2,30.1e-2,151);
%izracunamo tocko na nosilki zveznice, kjer je E=0.
Tpp=-[x1,y1]+[x2,y2];
Tpp=Tpp*(1+sqrt(2))+[x2,y2];
%izracunamo potencial te tocke
[Ex,Ey,Ez,V]=funcT2EV(Tpp(1),Tpp(2),0,QQ,xx,yy,zz);
fprintf("Koordinati tocke T'', kjer je E=0: (x'',y'')=(%e, %e) m\n", Tpp(1),Tpp(2));
fprintf("Potencial v T'': V(x'',y'')=%e V\n", V);
xxM=sort([xxM,Tpp(1)]);
yyM=sort([yyM,Tpp(2)]);
VV3=[VV3, 0, V];
if(min(VV3)>=0) minimum=-max(VV3)*5;
else minimum=min(VV3)*5;
end
loop2D(xxM,yyM,0,QQ,xx,yy,zz, 'result2Qb.dat');
%zgradimo datoteko s podatki za izris
generateGPfile("plotV2Qb.gpt","result2Qb.dat","slika_lab1_3.png",VV3, [minimum,max(VV3)*5], "x [m]","y [m]",xx,yy,QQ);
system("gnuplot -p plotV2Qb.gpt");


%izris detajla elelktricnega polja
xxM=linspace(x2-0.03,x2+.03,151);  %povecamo tocnost mreze, da dobimo lepsi izris!
yyM=linspace(y2-0.03,y2+0.03,151);

loop2D(xxM,yyM,0,QQ,xx,yy,zz, 'result2Qc.dat');
%zgradimo datoteko s podatki za izris
generateGPfile("plotV2Qc.gpt","result2Qc.dat","slika_lab1_4.png",VV3, [minimum,max(VV3)*5], "x [m]","y [m]",xx,yy,QQ);
system("gnuplot -p plotV2Qc.gpt");



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Konec 1. naloge lab. vaje %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
