%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Laboratorijska vaja %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% 2. naloga %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%skupen naboj na daljici v C
Q=10e-8;

%dolzina daljice 2l v m
dval=7

%stevilo modelnih tockastih nabojev za numericen izracun
N=6

%%%% Seznam ekvipotencialk  (v V) za izris %%%%%%
%Slika 1 -- analitika
VV1=[10, 20, 50, 80, 100, 200, 300, 400, 500, 600, 800, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 16000, 32000, 64000];
%Slika 2 -- numericni model
VV2=VV1;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Izracuni -- ne spreminjaj %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf("--------------------- Podatki -----------------------------\n");
fprintf("Q=%e C\n",Q);
fprintf("dval=%e m\n",dval);
fprintf("N=%d\n",N);




fprintf("------- Izracun polja v okolici daljice -- analiticen izraz --------\n");

%izrisemo ekvipotecialke
xx=linspace(-dval*1.121,dval*1.123,123);
zz=linspace(-dval*1.121,dval*1.123,123); 
y=0;

 fid=fopen('resultDD.dat','w');
    fprintf(fid,"#%1s %12s %12s %12s %12s %12s\n",'z','x','Ex','Ey','Ez','V');
    for j=1:length(zz)
        # printf("%d/%d",j,length(yy)); 
        for i=1:length(xx)
            [Ex,Ez,V]=EVpremica(xx(i),zz(j),Q,dval);
            fprintf(fid,"%1g %12g %12g %12g %12g %12g\n",zz(j),xx(i),Ex,0,Ez,V);
        endfor
        fprintf(fid,"\n");
        # printf("\n");
    endfor
    fclose(fid);

%zgradimo datoteko s podatki za izris
generateGPfile("plotDD1.gpt","resultDD.dat","slika_lab2_1.png",VV1, [min(VV1),max(VV1)], "z [m]","x [m]", xx,zz);
system("gnuplot -p plotDD1.gpt");



fprintf("------------ Izracun polja v okolici modela daljice --------------\n");
QQ=Q/N*ones(N,1);
xx=linspace(-dval/2,dval/2,N);
yy=zeros(size(xx));
zz=zeros(size(xx));
z=0;

%izrisemo ekvipotecialke
xxM=linspace(-dval*1.123,dval*1.123,123);
yyM=linspace(-dval*1.123,dval*1.123,123); 
loop2D(xxM,yyM,0,QQ,xx,yy,zz, 'resultDD2.dat');
generateGPfile("plotDD2.gpt","resultDD2.dat","slika_lab2_2.png",VV2, [min(VV2),max(VV2)], "z [m]","x [m]", xx,zz,QQ);

system("gnuplot -p plotDD2.gpt");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Konec 2. naloge lab. vaje %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
