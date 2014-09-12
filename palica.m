function [QQ,xx,yy,zz,AA,bb]=palica(n,azl,l,V0)
# izracun nabojev na prevodni palici
# n = stevilo nabojev
# azl = polmer palice (in nabojev) deljen z dolzino palice
 eps0=8.854e-12;
 k=4*pi*eps0;
 a=azl*l;
 AA=[0];
 bb=[0];
 for (i)=1:n
  AA(i,i)=1/a;
  bb(i)=V0;
  for j=(i+1):n
   AA(i,j)=1/(l*sqrt(((i-j)/(n))^2+azl^2));
   AA(j,i)=AA(i,j);
  endfor
 endfor

 for (i)=1:n
  xx(i)=0;
  yy(i)=0;
  zz(i)=l*(-1/2+(i-1/2)/n);
 endfor

 QQ=k*AA^(-1)*bb';
endfunction
