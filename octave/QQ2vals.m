function [qq]=QQ2vals(QQ,S) # qq in [-1,1]
	qmax=0;
	for i=1:length(QQ)
		if (abs(QQ(i)/S)>qmax)
			qmax=abs(QQ(i)/S);
		endif
	endfor
	for i=1:length(QQ)
	if qmax>0.0
		qq(i)=QQ(i)/(qmax*S);
	else
		qq(i)=QQ(i)/S;
	endif
	endfor
endfunction
