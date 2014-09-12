%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Laboratorijska vaja %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 4. naloga - ploscni elektrodi %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%dolzina stranice pravokotne elektrode a (v x-smeri) v m:
aP=2e-2;

%dolzina stranice pravokotne elektrode b (v y-smeri) v m:
bP=8e-2;

%visina trikotne elektrode v m:
vT=4e-2;

%dolzina stranice trikotne elektrode v m:
bT=8e-2;

%razdalja od ogljisca trikotnika do roba stranice pravokotne elektrode v m:
dPT=0.5e-2;

%stevilo delitev krajse stranice plosce(obicajno stranice a):
N=10;

%napetost med elektrodama:
UPT=10e3;

%seznam ekvipotencialk za izris:
VV=linspace(-UPT,UPT,10);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Izracuni -- ne spreminjaj %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[QQ,VP,VT,xxP,yyP,xxT,yyT]=Tcompanddump('slika_lab4_3.gpt',N,vT,bT,aP,bP,dPT,UPT);
system("gnuplot -p slika_lab4_3.gpt");


%izris ekvipotencialk
xxM=linspace(-1.2*aP,1.2*(dPT+vT),51);
yyM=linspace(-1.2*(max(bP,bT)/2),1.2*(max(bP,bT)/2),51);
V=[];
for i=xxM
	for j=yyM
		V=[V,TgetV(i,j,QQ,xxP,yyP,xxT,yyT)];
	end
end	
  fid=fopen('resultVkonica.dat','w');
    fprintf(fid,"#(z=%7g) %1s %12s %12s %12s %12s %12s\n",0,'x','y','Ex','Ey','Ez','V');
 for j=1:length(yyM)
        # printf("%d/%d",j,length(yy)); 
        for i=1:length(xxM)
            fprintf(fid,"%14g %12g %12g %12g %12g %12g\n",yyM(j),xxM(i),0,0,0,V(i+(j-1)*length(yyM)));
        endfor
        fprintf(fid,"\n");
        # printf("\n");
    endfor
    fclose(fid);


generateGPfile("plotVkonica.gpt","resultVkonica.dat","slika_lab4_4.png",VV, [min(VV),max(VV)], "x [m]","y [m]");
system("gnuplot -p plotVkonica.gpt");
 
