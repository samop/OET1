%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Laboratorijska vaja %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 5. naloga - navpicni ploscni %%%%%
%%%%%%%%%   elektrodi    %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%dolzina stranice a (v x-smeri) v m:
a=2e-2;

%dolzina stranice b (v y-smeri) v m:
b=8e-2;

%razdalja med ploscama d v m:
d=3e-2;

%stevilo delitev krajse stranice plosce(obicajno stranice a):
N=2;

%napetost med elektrodama:
Uab=10e3;

%ekvipotencialke za izris
%prva skica
VV1=linspace(-Uab,Uab,12);
%druga skica
VV2=linspace(-Uab,Uab,12);
%tretja skica
VV3=linspace(-Uab,Uab,12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Izracuni -- ne spreminjaj %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[xx,yy,zz,QQ,V1,V2]=NPcomputeQ(N,a,b,d,Uab);
xmin=-a;xmax=a;
ymin=-d;ymax=d;
np=100;
[yyT,xxT]=meshgrid(linspace(ymin,ymax,np),linspace(xmin,xmax,np));
xxT=xxT(:);
yyT=yyT(:);
z=0.0;
zzT=z*ones(np*np,1);
NPcompVmesh('vaja5_1.dat',xxT,yyT,zzT,xx,yy,zz,QQ); %pripravimo izhodne podatke

generateGPfile5("vaja5_1.gpt","vaja5_1.dat","slika_lab5_1.png",VV1,[min(VV1),max(VV1)] , "","", xxT,yyT,[],"1:2:4");


system("gnuplot -p vaja5_1.gpt");



%izris iz druge perspektive

xmin=-a;xmax=a;
ymin=-d;ymax=d;
zmin=-b;zmax=b;
np=100;
[zzT,xxT]=meshgrid(linspace(zmin,zmax,np),linspace(xmin,xmax,np));
xxT=xxT(:); 
zzT=zzT(:); 
y=0.5*d; 
yyT=y*ones(np*np,1);
NPcompVmesh('vaja5_2.dat',xxT,yyT,zzT,xx,yy,zz,QQ);

generateGPfile5("vaja5_2.gpt","vaja5_2.dat","slika_lab5_2.png",VV2,[min(VV2),max(VV2)] , "","", xxT,yyT,[],"1:3:4");

system("gnuplot -p vaja5_2.gpt");


%izris iz tretje perspektive
xmin=-a;xmax=a;
ymin=-d;ymax=d;
zmin=-b;zmax=b;
np=200;
[zzT,yyT]=meshgrid(linspace(zmin,zmax,np),linspace(ymin,ymax,np));
yyT=yyT(:); 
zzT=zzT(:); 
x=0.0*a; 
xxT=x*ones(np*np,1);
NPcompVmesh2('vaja5_3.dat',xxT,yyT,zzT,xx,yy,zz,QQ);

generateGPfile5("vaja5_3.gpt","vaja5_3.dat","slika_lab5_3.png",VV2,[min(VV2),max(VV2)] , "","", xxT,yyT,[],"2:3:4");

system("gnuplot -p vaja5_3.gpt");




