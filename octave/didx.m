function [idx]=didx(i,NN)
# vrne index diska na katrem je i-ti element
	found=false;
	idx=-1; # ce idx<0 ali idx>NN(n)
	j=1;
	n=0;
	while ((not(found) & (j<=length(NN))))
		n=n+NN(j);
		if (i<=n)
			found=true;
			idx=j;
		endif
		j=j+1;
	end;
endfunction
