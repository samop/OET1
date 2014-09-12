function [Ex,Ey,Ez,V]=funcT2EV(x,y,z,QQ,xx,yy,zz)
# E poljska jakost v tocki (x,y,z) za tockaste naboje QQ(i)
# s koordinatami (xx(i),yy(i),zz(i))

    eps0=8.854e-12;
    Ex=0.0;
    Ey=0.0;
    Ez=0.0;
    V=0.0;

    for i=1:length(QQ)
        RR=[x-xx(i),y-yy(i),z-zz(i)];
        R=norm(RR);
        k=QQ(i)/(4*pi*eps0*R^3);
        dEx=k*RR(1);
        dEy=k*RR(2);
        dEz=k*RR(3);
        Ex=Ex+dEx;
        Ey=Ey+dEy;
        Ez=Ez+dEz;
        V=V+QQ(i)/(4*pi*eps0*R);
    endfor
endfunction
