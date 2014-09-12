function [rr1,rr2,tt1,tt2]=getslices(b,ll,nn)
    rr1=[];
    rr2=rr1;
    tt1=rr2;
    tt2=tt1;
    k=0;
    for i=1:length(nn)
        t=0.0;
	n=nn(i);
        dt=2*pi/n;
        r1=b*ll(i);
        r2=b*ll(i+1);
        for j=1:n
            k=k+1;
            rr1(k)=r1;
            rr2(k)=r2;
            tt1(k)=t;
            tt2(k)=t+dt;
            #rr(k)=(r1+r2)/2;
            #tt(k)=(2*t+dt)/2;
            #xx(k)=rr(k)*cos(tt(k));
            #yy(k)=rr(k)*sin(tt(k));
            #SS(k)=0.5*(r2^2-r1^2)*dt;
            t=t+dt;
        endfor
    endfor
endfunction
