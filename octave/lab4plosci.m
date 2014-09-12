%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Laboratorijska vaja %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 4. naloga - ploscni elektrodi %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%dolzina stranice a (v x-smeri) v m:
a=2e-2;

%dolzina stranice b (v y-smeri) v m:
b=8e-2;

%razdalja med ploscama d v m:
d=3e-2;

%stevilo delitev krajse stranice plosce(obicajno stranice a):
N=4;

%napetost med elektrodama:
Uab=10e3;

%ekvipotencialke za izris
VV=linspace(-Uab,Uab,12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Izracuni -- ne spreminjaj %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[nx,ny]=getnxy(N,a,b);
x1=-(a+d)/2;
y1=0;
x2=(a+d)/2;
y2=0;
[QQ,AA,bb]=PgetQQ(a,b,x1,y1,x2,y2,nx,ny,Uab);

%naredi gpt datoteko za izris barvno kodiranega naboja
rects2gpt('slika_lab4_1.gpt',QQ,a,b,x1,y1,x2,y2,nx,ny);
%Va,Vb
%bash
system("gnuplot -p slika_lab4_1.gpt");


%izris ekvipotencialk. Na star nacin
%dobimo pozicijo nabojev.
[XX,YY]=Pgetxxyy(a,b,x1,y1,x2,y2,nx,ny);
%postavimo mrezo
zz=zeros(size(QQ));
xxM=linspace(-1.2*(a+d/2),1.2*(a+d/2),41);
yyM=linspace(-1.2*b/2,1.2*b/2,41); 
loop2D(xxM,yyM,0,QQ,XX,YY,zz, 'resultVplosci.dat');


generateGPfile("plotVplosci.gpt","resultVplosci.dat","slika_lab4_2.png",VV, [min(VV),max(VV)], "x [m]","y [m]");
system("gnuplot -p plotVplosci.gpt");

