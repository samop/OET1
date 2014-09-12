function Etogpt(QQ,xxQ,yyQ,zzQ,fnin,fnout,k,a)
    fin=fopen(fnin,"r");
    fout=fopen(fnout,"w");
# glava gpt datoteke
    fprintf(fout,"#zacetne nastavitve\n");
    fprintf(fout,"reset;unset hidden3d;set view equal xyz;set grid;unset key;unset contour;set surface;set border;set xtics;set ytics;set ztics;set xrange [%f:%f];set yrange [%f:%f];set zrange [%f:%f];\n",-a,a,-a,a,-a,a);
    fprintf(fout,"#puscice z ukazom set arrow\n");

# preberemo prvo vrstico, ki je komentar...
    fscanf(fin,"%s %s %s %s %s %s %s %s\n",[8,1]);
# in vse ostale
    [vv,nv]=fscanf(fin,"%g\t%g\t%g\t%g\t%g\t%g\t%g",[7,Inf]);

# zapisemo puscice na fnout:
    for i=1:length(vv)
        x=vv(1,i);
        y=vv(2,i);
        z=vv(3,i);
        Ex=vv(4,i);
        Ey=vv(5,i);
        Ez=vv(6,i);
        EE=[Ex,Ey,Ez];
        eE=k*EE/norm(EE);
        if (abs(Ex) < Inf)
        fprintf(fout,"set arrow %5d from %10g,%10g,%10g rto %10g,%10g,%10g\n",i,x,y,z,k*Ex,k*Ey,k*Ez);
        #fprintf(fout,"set arrow %5d from %10g,%10g,%10g rto %10g,%10g,%10g\n",i,x,y,z,eE(1),eE(2),eE(3));
        endif
    endfor

    fprintf(fout,"\n");
    fprintf(fout,"set isosamples 20,20;set parametric;set urange [0:2*pi];set vrange [-pi/2:pi/2];r=0.05;\n");
    fprintf(fout,"splot ");
    for i=1:length(QQ)-1
     fprintf(fout,"%f+r*cos(v)*cos(u),%f+r*cos(v)*sin(u),%f+r*sin(v) fc rgb '%s', ",xxQ(i),yyQ(i),zzQ(i),barvaQ(QQ(i)));
    endfor
    i=length(QQ);
     fprintf(fout,"%f+r*cos(v)*cos(u),%f+r*cos(v)*sin(u),%f+r*sin(v) fc rgb '%s' ",xxQ(i),yyQ(i),zzQ(i),barvaQ(QQ(i)));
    fprintf(fout,"\n");
    #for i=1:length(vv); fprintf(fout,"unset arrow %5d\n",i); endfor
    fclose(fin);
    fclose(fout);
endfunction
