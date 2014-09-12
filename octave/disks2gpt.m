function disks2gpt(fn,QQQ,rrr1,rrr2,ttt1,ttt2,nnn,nnk,NN)
	dumpgptstart(fn,rrr2(NN(1)));
	qq=QQ2vals_koaks(QQQ,rrr1,rrr2,ttt1,ttt2);
	arcid=0;
	e=0;
	en=0;
	for i=1:length(NN)
	 s=e+1;
	 e=s+NN(i)-1;
	 sn=en+1;
	 en=sn+nnk(i)-1;
		#s,e,sn,en #,rrr1(s:e),rrr2(s:e),ttt1(s:e),ttt2(s:e),QQQ(s:e)
		#nnk(i)
		[arcid]=slices2gpt(fn,qq(s:e),rrr1(s:e),rrr2(s:e),ttt1(s:e),ttt2(s:e),nnn(sn:en),arcid);
	endfor
	dumpgptend(fn);
endfunction
