function [s]=getrgbcol(x)
# x je barva v obmocju [-1,1]
	if (abs(x)>1.0)
		printf('rgbcol error |x|>1: dx=%g.\n',abs(x)-1);
		if (x>0.0)
			x=1.0;
		else
			x=-1.0;
		endif
	endif
	#c=round(255*(1-exp(-abs(x)/0.25)));
	c=255-round(255*abs(x)^(2/3));
	h=dec2hex(c);
	if (x>0.0)
		s=sprintf("FF%02s%02s",h,h);
		s=strrep(s,' ','0');
	else
		s=sprintf("%02s%02sFF",h,h);
		s=strrep(s,' ','0');
	endif
endfunction
