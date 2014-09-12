function [qq]=QQ2vals_koaks(q,rr1,rr2,tt1,tt2)
	a=0;
	for i=1:length(q)
 		S(i)=rrtt2S(rr1(i),rr2(i),tt1(i),tt2(i));
		if (abs(q(i)/S(i))>a)
			a=abs(q(i)/S(i));
		endif
	endfor
	for i=1:length(q)
	if a>0.0
		qq(i)=q(i)/(a*S(i));
	else
		qq(i)=q(i)/S(i);
	endif
	endfor
endfunction
