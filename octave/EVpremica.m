function [Ex,Ez,V]=EVpremica(x,z,Q,dval)

r=x;
l=dval/2;
V=Q/(8*pi*8.85e-12*l)*log((sqrt(r.^2+(z+l).^2)+z+l)./(sqrt(r.^2+(z-l).^2)+z-l));
if(r==0) 
    Ex=0;
else
    Ex=Q/(8*pi*8.85e-12*l)*((z+l)./(r*sqrt(r.^2+(z+l).^2))-(z-l)./(r*sqrt(r.^2+(z-l).^2)));
end

Ez=Q/(8*pi*8.85e-12*l)*(1./sqrt(r.^2+(z-l).^2)-1./sqrt(r.^2+(z+l).^2));


end
