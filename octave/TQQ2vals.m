function [qq]=TQQ2vals(QQ,nP,nT,SP,ST) # qq in [-1,1]
	qmax=0;
	for i=1:nP
		if (abs(QQ(i)/SP)>qmax)
			qmax=abs(QQ(i)/SP);
		endif
	endfor
	for i=(nP+1):(nP+nT)
		if (abs(QQ(i)/ST)>qmax)
			qmax=abs(QQ(i)/ST);
		endif
	endfor
	for i=1:nP
	if qmax>0.0
		qq(i)=QQ(i)/(qmax*SP);
	else
		qq(i)=QQ(i)/SP;
	endif
	endfor
	for i=(nP+1):(nP+nT)
	if qmax>0.0
		qq(i)=QQ(i)/(qmax*ST);
	else
		qq(i)=QQ(i)/ST;
	endif
	endfor
endfunction
