% elliptic umbilic

% @author  Christian Offen
% @version 1.0

epsilon = 2.5; % perturbation epsilon=2.5
kappa =0;       % cut off for complex valued numbers

aa = linspace(-2,2,100);
r=sqrt(aa(1)^2+epsilon^2/4);
xx = linspace(-epsilon/2-r,-epsilon/2+r,50);

[a,x]=meshgrid(aa,xx);

figure
hold on
title('perturbed elliptic umbilic D_{-4}')
xlabel('\mu_1'); ylabel('\mu_2'); zlabel('\mu_3'); grid on; view([0 0]);
ax=gca;

sgns=[-1,1,-1,1];

for j=1:2
    sgn=sgns(j);
    y=sgn*sqrt(a.^2-x.*(x+epsilon));
    b=-2*x.*(y+a)-2*epsilon*y;
    c=-x.^2+y.*(y-2*a);
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
    h(j)=surf(real(a),real(b),real(c)); 
end

%% second layer

aa = linspace(-2,2,100);
yy = linspace(-r,r,100);

[a,y]=meshgrid(aa,yy);

for j=3:4
    sgn=sgns(j);
    x = -epsilon/2 + sgn*sqrt(a.^2+epsilon^2/4-y.^2);
    b=-2*x.*(y+a)-2*epsilon*y;
    c=-x.^2+y.*(y-2*a);
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
    h(j)=surf(real(a),real(b),real(c)); 
end

for j=1:4
    h(j).LineStyle='none';
%     h(j).FaceLighting='none';
end

view([65.0667 32.4000])
% axis off
title('')
ax.XTickLabel={}; ax.YTickLabel={}; ax.ZTickLabel={};
ax.FontSize=30;
if epsilon==0
    bifpt = plot3(0,0,0,'*','MarkerSize',40,'Color','k','LineWidth',8);
end

material metal
camlight left
camlight left
%camlight right
axis tight
%% print
orient landscape
%set(gca,'FontSize',20);
% print('elliptic_umbilic.pdf','-dpdf','-fillpage')