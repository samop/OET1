function [Ex,Ez,V]=EVpremica(x,z,Q,dval)

r=x;
l=dval/2;
V=Q/(8*pi*8.85e-12*l)*log((sqrt(r.^2+(z+l).^2)+z+l)./(sqrt(r.^2+(z-l).^2)+z-l));Ex=0;
Ez=0;


end
