% Alternative unfolding hyperbolic umbilic

% @author  Christian Offen
% @version 1.0

e = 0;      % perturbation parameter 0.6


aview = [-2.0000    2.0000   -0.4000    0.2000   -0.4000    0.2000];

figure(); hold on; xlabel('a'); ylabel('b'); zlabel('c'); grid on; view([0 0]);
title({'Level bifurcation surface of the hyperbolic umbilic D^+_4'; ...
    ['with pertubation parameter \epsilon = ' mat2str(e) ]})
axis(aview)



xx = linspace(-1,1,2e2+1);
yy = linspace(-1,1,2e2+1);
[x,y] = meshgrid(xx,yy);

signs = [-1,1,-1,1,-1,1];

for j = 1:2
    a = -1/2*(e + signs(j)*sqrt(e^2+144*x.*y));
    b = -3*x.^2-(a+e).*y;
    c = -3*y.^2-a.*x;
    a(abs(imag(a))>0) = NaN;
   
    h(j)=surf(real(a),real(b),real(c));
    
end


aa = linspace(-1,1,1e2);
[a,y] = meshgrid(aa,yy);


    x = a.*(e+a)./(36*y);
    b = -3*x.^2-(a+e).*y;
    c = -3*y.^2-a.*x;
      a(abs(imag(a))>0) = NaN;
    %b(abs(imag(b))>0) = NaN;
    %c(abs(imag(c))>0) = NaN;
    h(3)=surf(real(a),real(b),real(c));
    

[a,x] = meshgrid(aa,xx);


    y = a.*(e+a)./(36*x);
    b = -3*x.^2-(a+e).*y;
    c = -3*y.^2-a.*x;
    
%   a(abs(imag(a))>0) = NaN;
    %b(abs(imag(b))>0) = NaN;
    %c(abs(imag(c))>0) = NaN;
    h(4)=surf(real(a),real(b),real(c));
    

%%
for j=1:4
   h(j).LineStyle='none' ;
   h(j).EdgeColor=0.4*[1 1 1];
   h(j).FaceAlpha=0.7;
end
view([-58.7333 22.2])
%axis vis3d
camlight right
camlight headlight
material metal




