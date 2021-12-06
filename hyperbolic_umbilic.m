% Illustration D+4 hyperbolic umbrilic with perturbation term

% @author  Christian Offen
% @version 1.0

e = 0.6;      % perturbation parameter % 0.6
kappa = 0;
xx = linspace(-2,2,4e2);
yy = linspace(-2,2,4e2);
[x,y] = meshgrid(xx,yy);
aview = [-0.7055    0.6773   -1.5281    1.6014   -1.0069    0.5319];

figure(); hold on; xlabel('\mu_1'); ylabel('\mu_2'); zlabel('\mu_3'); grid on; view([0 0]);
title({'Level bifurcation surface of the hyperbolic umbilic D^+_4'; ...
    ['with pertubation parameter \epsilon = ' mat2str(e) ', precision parameter complex \kappa = ' mat2str(kappa) ]     })
axis(aview)
ax=gca;
ax.XTickLabel={}; ax.YTickLabel={}; ax.ZTickLabel={};
ax.FontSize=30;

signs = [-1,1,-1,1,-1,1];

for j=1:2
    sig = signs(j);    
    a = sig*sqrt(y.^2-x.*(x+e));
    b = -2*x.*y + 2*a.*x - 2*e*y;
    c = -x.^2-y.^2-2*a.*y;
    a(abs(imag(a))>kappa) = NaN;
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
    h(j)=surf(real(a),real(b),real(c)); 
end

aa = linspace(-0.2,0.2,11);
[a,x] = meshgrid(aa,xx);

for j=3:4
    sig = signs(j);
    y = sig*sqrt(a.^2+x.*(x+e));
    b = -2*x.*y + 2*a.*x - 2*e*y;
    c = -x.^2-y.^2-2*a.*y;
    a(abs(imag(a))>kappa) = NaN;
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
    h(j)=surf(real(a),real(b),real(c)); 
end

[a,y] = meshgrid(aa,yy);

for j=5:6
    sig = signs(j);
    x = -e/2+sig*sqrt(y.^2-a.^2+e^2/4);
    b = -2*x.*y + 2*a.*x - 2*e*y;
    c = -x.^2-y.^2-2*a.*y;
    a(abs(imag(a))>kappa) = NaN;
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
    h(j)=surf(real(a),real(b),real(c)); 
end

bifpt1 = plot3(e/2,-e^2/2,-e^2/4,'*','MarkerSize',40,'Color','k','LineWidth',8);
bifpt2 = plot3(-e/2,e^2/2,-e^2/4,'*','MarkerSize',40,'Color','k','LineWidth',8);


%% Values for x,y to given a

for j=1:6
   h(j).LineStyle='none' ;
   h(j).EdgeColor=0.4*[1 1 1];
   h(j).FaceAlpha=0.7;
end
view([-58.7333 22.2])
%axis vis3d
c1=camlight('right');
c2=camlight('headlight');
c2.Color=0.5*[1 1 1];
material metal

%% print
orient landscape
%axis off
title('')
% set(gca,'FontSize',20);
% print('hyperbolic_umbilic_perturbed.pdf','-dpdf','-fillpage')