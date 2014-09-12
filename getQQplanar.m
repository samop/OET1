function [QQ,Va,Vb,AA,bb,xx]=getQQplanar(rrr1,rrr2,ttt1,ttt2,NN,Uab)
	eps0=8.854e-12;
	Aii=2.97320959825;
	AA=[];
	bb=[];
	nr=length(rrr1);
	for i=1:nr
		[ri,ti,xi,yi]=rrtt2rtxy(rrr1(i),rrr2(i),ttt1(i),ttt2(i));
		[Si]=rrtt2S(rrr1(i),rrr2(i),ttt1(i),ttt2(i));
		AA(i,i)=Aii/sqrt(Si);
		%bb(i)=VV(didx(i,NN));
		bb(i)=0.0;
		for j=(i+1):nr
			[rj,tj,xj,yj]=rrtt2rtxy(rrr1(j),rrr2(j),ttt1(j),ttt2(j));
			[Sj]=rrtt2S(rrr1(j),rrr2(j),ttt1(j),ttt2(j));
			AA(i,j)=1/sqrt((xi-xj)^2+(yi-yj)^2);
			AA(j,i)=AA(i,j);
		endfor
		
		# dela samo za dva prevodnika!
		if (i <= (NN(1)))
			#disp([i,nr]);
			AA(i,nr+1)=0;
			AA(i,nr+2)=-1;
		else
			#disp([i,nr]);
			AA(i,nr+1)=-1;
			AA(i,nr+2)=0;
		endif
	endfor
	for j=1:nr
		AA(nr+1,j)=0;
		AA(nr+2,j)=1;
	endfor
	AA(nr+1,nr+1)=1;
	AA(nr+1,nr+2)=-1;
	AA(nr+2,nr+1)=0;
	AA(nr+2,nr+2)=0;
	bb(nr+1)=Uab;
	bb(nr+2)=0.0;
	
	xx=AA^(-1)*bb';
	QQ=xx(1:nr);
	Va=xx(nr+1);
	Vb=xx(nr+2);
endfunction
