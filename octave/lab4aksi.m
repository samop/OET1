%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Laboratorijska vaja %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 4. naloga -- krozni elektrodi %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%polmer zile v m:
a=1e-2;

%notranji polmer plasca v m:
b=2e-2;

%zunanji polmer plasca v m:
c=3e-2;

%stevilo delitev zile:
N=10;

%napetost med zilo in plascem v V:
Uab=10e3;

%ekvipotencialke za izris

VV=linspace(0,Uab,6);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Izracuni -- ne spreminjaj %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bb=[a,c];
aazb=[0.0,b/c];
[R1,R2,T1,T2,nnn,nnk,NN]=compdisks(bb,aazb,N);
[QQ,Va,Vb,AA,bb,xx]=getQQplanar(R1,R2,T1,T2,NN,Uab); 

%naredi gpt datoteko za izris barvno kodiranega naboja
disks2gpt('slika_lab4_5.gpt',QQ,R1,R2,T1,T2,nnn,nnk,NN);
%Va,Vb
%bash
system("gnuplot -p slika_lab4_5.gpt");


%% izrisemo se ekvipotencialke
XX=[];
YY=[];
for i=1:length(QQ);
	[r,t,x,y]=rrtt2rtxy(R1(i),R2(i),T1(i),T2(i));
	XX=[XX,x];
	YY=[YY,y];
end
zz=zeros(size(QQ));
xxM=linspace(-1.2*c,1.2*c,91);
yyM=linspace(-1.2*c,1.2*c,91); 
loop2D(xxM,yyM,0,QQ*(4*pi*8.85e-12),XX,YY,zz, 'resultVkoaks.dat');

generateGPfile("plotVkoaks.gpt","resultVkoaks.dat","slika_lab4_6.png",VV, [min(VV),max(VV)], "x [m]","y [m]");
system("gnuplot -p plotVkoaks.gpt");



