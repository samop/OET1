function [rrr1,rrr2,ttt1,ttt2,nnn,nnk,NN]=compdisks(bb,aazb,N)
	ii=getii(bb);
	[bb]=ordervec(bb,ii);
	[aazb]=ordervec(aazb,ii);
	if not(checkgeom(bb,aazb))
		disp('geometrijski podatki ne ustrezajo, diski se prekrivajo.');
		return;
	endif
	NN=makeNN(bb,aazb,N);
	#bb,aazb,VV,NN

	rrr1=[];
	rrr2=[];
	ttt1=[];
	ttt2=[];
	nnn=[];
	nnk=[];
	# geometrija
	for i=1:length(bb)
		[yy,nn]=diskmesh(aazb(i),NN(i));
		[rr1,rr2,tt1,tt2]=getslices(bb(i),yy,nn);
		rrr1=[rrr1,rr1];
		rrr2=[rrr2,rr2];
		ttt1=[ttt1,tt1];
		ttt2=[ttt2,tt2];
		nnn=[nnn,nn];
		nnk=[nnk,length(nn)];
	endfor
endfunction
