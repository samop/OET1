function [ip,jp]=Tgetipjp(np)
	ip=ceil(0.5*(1+sqrt(1+8*np)))-1;
	jp=np-ip.*(ip-1)./2;
endfunction
