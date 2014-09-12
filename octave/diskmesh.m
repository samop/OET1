function [yy,nn]=diskmesh(q,N)
# razdeli disk (a,b) na N "cimbolj enakih delov 
# q=a/b
# yy: polmeri delitev deljeni z b, dolzina n+1
# nn: stevilo delitev med yy[k] in yy[k+1], dolzina n, fi[k]=2*pi/nn[k]
    n=ceil(sqrt(N*(1-q)/(pi*(1+q))));
    yy=linspace(q,1,n+1);
    nn2=linspace(1,n,n);
    c1=(1-q)/n;
    c2=sqrt(pi*N/(1-q^2));
    nn2=(2*q+(2.*nn2-1)*c1)*c2;
    nn2=nn2*N/sum(nn2);
    if (q==0.0)
        nn2(n)=nn2(n)+nn2(1)+1;
        nn2(1)=1;
    endif
    nn(1)=nn2(1);
    for i=1:(n-1)
        nn(i)=round(nn2(i));
        d=nn2(i)-nn(i);
    endfor
    if (n>1)
        nn(n)=N-sum(nn);
    else
        nn(1)=N;
    endif
endfunction
