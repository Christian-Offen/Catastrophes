% Elliptic umbilic with cusp lines

% @author  Christian Offen
% @version 1.0

epsilon = 1.9;    % perturbation
e = epsilon;
kappa =0;       % small value determines whether imaginary

gridpts = 200;

aa = linspace(-2,2,gridpts);
r=sqrt(aa(1)^2+epsilon^2/4);
xx = linspace(-epsilon/2-r,-epsilon/2+r,gridpts);

[a,x]=meshgrid(aa,xx);

%figure
clf
hold on

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

aa = linspace(-2,2,gridpts);
yy = linspace(-r,r,gridpts);

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



%% degenerate points

lcusps=[];

a=linspace(-2,2,gridpts);

y=(1/4).*((-8).*a.^3+(-2).*a.*e.^2+((-1).*(4.*a.^2.*e+e.^3).^2).^(1/2)).^(-1/3).*(4.*a.^2+e.^2+((-8).*a.^3+(-2).*a.*e.^2+((-1).*(4.*a.^2.*e+e.^3).^2).^(1/2)).^(2/3));
y = real(y);

    sgn=-1*sign(epsilon);
    x = -epsilon/2 + sgn*sqrt(a.^2+epsilon^2/4-y.^2);
    b=-2*x.*(y+a);
    c=-x.^2+y.*(y-2*a)-2*epsilon*x;
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
     lcusps = [lcusps plot3(real(a),real(b),real(c))];  

y=(sqrt(-1)*(1/8)).*((-8).*a.^3+(-2).*a.*e.^2+((-1).*(4.*a.^2.*e+e.^3).^2).^(1/2)).^(-1/3).*((-4).*((sqrt(-1)*(-1))+3.^(1/2)).*a.^2+(-1).*((sqrt(-1)*(-1))+3.^(1/2)).*e.^2+(sqrt(-1)+3.^(1/2)).*((-8).*a.^3+(-2).*a.*e.^2+((-1).*(4.*a.^2.*e+e.^3).^2).^(1/2)).^(2/3));
y = real(y);

    sgn=-1*sign(epsilon);
    x = -epsilon/2 + sgn*sqrt(a.^2+epsilon^2/4-y.^2);
    b=-2*x.*(y+a);
    c=-x.^2+y.*(y-2*a)-2*epsilon*x;
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
  lcusps = [lcusps plot3(real(a),real(b),real(c))];  


y=(sqrt(-1)*(-1/8)).*((-8).*a.^3+(-2).*a.*e.^2+((-1).*(4.*a.^2.*e+e.^3).^2).^(1/2)).^(-1/3).*((-4).*(sqrt(-1)+3.^(1/2)).*a.^2+(-1).*(sqrt(-1)+3.^(1/2)).*e.^2+((sqrt(-1)*(-1))+3.^(1/2)).*((-8).*a.^3+(-2).*a.*e.^2+((-1).*(4.*a.^2.*e+e.^3).^2).^(1/2)).^(2/3));
y = real(y);

    sgn=1*sign(epsilon);
    x = -epsilon/2 + sgn*sqrt(a.^2+epsilon^2/4-y.^2);
    b=-2*x.*(y+a);
    c=-x.^2+y.*(y-2*a)-2*epsilon*x;
    b(abs(imag(b))>kappa) = NaN;
    c(abs(imag(c))>kappa) = NaN;
  lcusps = [lcusps plot3(real(a),real(b),real(c))]; 


%% Styling

a=gca;
a.FontSize=30;
a.XTickLabel={};
a.YTickLabel={};
a.ZTickLabel={};

title('perturbed elliptic umbilic D_{-4}')
lbl(1)=xlabel('\mu_1');
lbl(2)=ylabel('\mu_2');
lbl(3)=zlabel('\mu_3');

[lcusps(:).LineWidth]=deal(10);
view([ -39.8321,  34.0246])

[lcusps(:).Color]=deal([0 0 0]);
colormap(gray)
[S.LineStyle]=deal('none');
[S.FaceAlpha]=deal(0.8);
brighten(-0.2)

lbl(1).Position = lbl(1).Position + [0 0 -2];
lbl(2).Position = lbl(2).Position + [0 0 -1];
lbl(3).Position = lbl(3).Position + [-3.7 0 18];
