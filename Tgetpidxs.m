function [ip1,ip2,ip3,p1,p2]=Tgetpidxs(i,j);
	p1=round(i.*(i-1)/2)+1;
	p2=p1+i;
	if (rem(j,2)==1)
		ip1=p1+(j-1)/2;
		ip2=p2+(j-1)/2;
		ip3=ip2+1;
		#printf('lih %2d | [%3d %3d %3d]\n',j,ip1,ip2,ip3);
	else
		ip1=p1+(j/2-1);
		ip3=ip1+1;
		ip2=p2+j/2;
	endif
endfunction
