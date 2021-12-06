% Elliptic umbilic

% @author  Christian Offen
% @version 1.0

epsilon = 2;    % perturbation
kappa =0;       % small value determines whether imaginary

aa = linspace(-2,2,50);
r=sqrt(aa(1)^2+epsilon^2/4);
xx = linspace(-epsilon/2-r,-epsilon/2+r,50);

[a,x]=meshgrid(aa,xx);

figure
hold on
title('perturbed elliptic umbilic D_{-4}')
xlabel('a')
ylabel('b')
zlabel('c')

S = gobjects(2,2);

sgns=[-1,1];

for j=1:2
    sgn=sgns(j);
    y=sgn*sqrt(a.^2-x.*(x+epsilon));
    b=-2*x.*(y+a);
    c=-x.^2+y.*(y-2*a)-2*epsilon*x;
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
    S(1,j) = surf(real(a),real(b),real(c)); 
end

%% second layer

aa = linspace(-2,2,50);
yy = linspace(-r,r,50);

[a,y]=meshgrid(aa,yy);

for j=1:2
    sgn=sgns(j);
    x = -epsilon/2 + sgn*sqrt(a.^2+epsilon^2/4-y.^2);
    b=-2*x.*(y+a);
    c=-x.^2+y.*(y-2*a)-2*epsilon*x;
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
    S(2,j)=surf(real(a),real(b),real(c)); 
end


view(30,20)