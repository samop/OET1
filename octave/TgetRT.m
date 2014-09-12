function [xxT,yyT,iip1,iip2,iip3]=TgetRT(n,v,b)
# n je delitev po osnovnici in krakih, n=1: en sam trikotnik
# v: visina na osnovnico (na koordinati x0) 
# b: dolzina osnovnice (vzporedna y osi)
# vrh trikotnika je (x0,y0)
# xT(i),yT(i): tezisce i-tega trikotnicka
# vseh trikotnikov je nt=n^2, vseh tock je np=n*(n+1)/2
	nt=n^2;
	nnt=linspace(1,nt,nt);
	[iit,jjt]=Tgetitjt(nnt);
	for k=1:length(nnt)
	 [iip1(k),iip2(k),iip3(k),pp1(k),pp2(k)]=Tgetpidxs(iit(k),jjt(k));
	 [ip1,jp1]=Tgetipjp(iip1(k));
	 [ip2,jp2]=Tgetipjp(iip2(k));
	 [ip3,jp3]=Tgetipjp(iip3(k));
	 [xx(1),yy(1)]=Tgetxy(ip1,jp1,n,v,b,0,0);
	 [xx(2),yy(2)]=Tgetxy(ip2,jp2,n,v,b,0,0);
	 [xx(3),yy(3)]=Tgetxy(ip3,jp3,n,v,b,0,0);
	 xxT(k)=sum(xx)/3;
	 yyT(k)=sum(yy)/3;
	endfor
	#[nnt',iit',jjt',iip1',iip2',iip3']
	#[xxT',yyT']
endfunction
