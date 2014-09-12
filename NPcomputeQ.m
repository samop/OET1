function [xx,yy,zz,QQ,V1,V2]=NPcomputeQ(n,a,b,d,Ug)
 [nx,nz]=NPgetnxy(n,a,b);
 xmin=-0.5*a;
 xmax=+0.5*a;
 dx=(xmax-xmin)/nx;
 x1=xmin+0.5*dx;
 x2=xmax-0.5*dx;
 zmin=-0.5*b;
 zmax=+0.5*b;
 dz=(zmax-zmin)/nz;
 z1=zmin+0.5*dz;
 z2=zmax-0.5*dz;

 [zz0,xx0]=meshgrid(linspace(z1,z2,nz),linspace(x1,x2,nx));
 yy0=ones(nx*nz,1);
 xx=[xx0(:);xx0(:)];
 zz=[zz0(:);zz0(:)];
 yy=[-0.5*d*yy0;+0.5*d*yy0];
 [QQ,V1,V2]=NPgetQQ(xx,yy,zz,Ug,a,b,nx,nz);
endfunction
