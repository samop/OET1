%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Laboratorijska vaja %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 5. naloga - navpicni ploscni %%%%%
%%%%%%%%%   elektrodi    %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%dolzina stranice a (v y-smeri) v m:
a=8e-2;

%dolzina stranice b (v x-smeri) v m:
b=2e-2;

%razdalja med ploscama d v m:
d=3e-2;

%stevilo delitev krajse stranice plosce(obicajno stranice a):
N=5;

%napetost med elektrodama:
Uab=10e3;

%ekvipotencialke za izris
%prva skica
VV1=linspace(-Uab/2,Uab/2,12);
%druga skica
VV2=linspace(-Uab/2,Uab/2,12);
%tretja skica
VV3=linspace(-Uab/2,Uab/2,12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Izracuni -- ne spreminjaj %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[xx,yy,zz,QQ,V1,V2]=NPcomputeQ(N,a,b,d,Uab);

%izris naboja na ploscah
NPrects2gpt('vaja5_1.gpt',N,a,b,d,xx,yy,zz,QQ);
system("gnuplot -p vaja5_1.gpt");

%izris ekvipotencialk iz prereza
xmin=-a;xmax=-xmin;
ymin=-d;ymax=-ymin;
np=50;
[yyT,xxT]=meshgrid(linspace(ymin,ymax,np),linspace(xmin,xmax,np));
xxT=xxT(:);
yyT=yyT(:);
z=0.0;
zzT=z*ones(np*np,1);
NPcompVmesh('vaja5_2.dat',xxT,yyT,zzT,xx,yy,zz,QQ); %pripravimo izhodne podatke
r=ymax/xmax;
generateGPfile5("vaja5_2.gpt","vaja5_2.dat","slika_lab5_2.png",VV1,[min(VV1),max(VV1)] , "x","y", xxT,yyT,[],"1:2:4", r);

system("gnuplot -p vaja5_2.gpt");


%izris iz druge perspektive
xmin=-a;xmax=-xmin;
ymin=-d;ymax=-ymin;
zmin=-b;zmax=-zmin;
np=50;
[zzT,yyT]=meshgrid(linspace(zmin,zmax,np),linspace(ymin,ymax,np));
yyT=yyT(:); 
zzT=zzT(:); 
x=0.0*a; 
xxT=x*ones(np*np,1);
NPcompVmesh2('vaja5_3.dat',xxT,yyT,zzT,xx,yy,zz,QQ);
r=zmax/ymax;

generateGPfile5("vaja5_3.gpt","vaja5_3.dat","slika_lab5_3.png",VV2,[min(VV2),max(VV2)] , "y","z", xxT,yyT,[],"2:3:4", r);

system("gnuplot -p vaja5_3.gpt");




