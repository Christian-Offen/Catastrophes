% Hyperbolic umbilic

% @author  Christian Offen
% @version 1.0

e=0.;   % perturbation e=0.8
axlims=[-0.5912    0.7667   -0.8535    0.7199   -0.6290    0.1677];

%% Surface parametrisation in mu and y 
% a =mu, b=mux, c=muy

muu = linspace(-1,1,200);
yy = linspace(-0.3,0.3,200);
[mu,y] = meshgrid(muu,yy);

ss = sqrt(-mu.^2-2*mu.*y + 3*y.^2 + e^2/16);
ss(imag(ss)~=0) = NaN;

a = mu;
b = 1/2*(y.*(4*ss-e)-mu.*(4.*ss+e));
c = -2*mu.*y-3*y.^2-1/16*(4*ss + e).^2;

a(a>axlims(2) | a < axlims(1))=NaN;
b(b>axlims(4) | b < axlims(3))=NaN;
c(c>axlims(6) | c < axlims(5))=NaN;

clf
pl(1)=surf(a,b,c);
hold on

ss = -ss;
b = 1/2*(y.*(4*ss-e)-mu.*(4.*ss+e));
c = -2*mu.*y-3*y.^2-1/16*(4*ss + e).^2;

a(a>axlims(2) | a < axlims(1))=NaN;
b(b>axlims(4) | b < axlims(3))=NaN;
c(c>axlims(6) | c < axlims(5))=NaN;

pl(2)=surf(a,b,c);


%% Surface parametrisation in x,y
%{
[x,y] = meshgrid(linspace(-0.5,0.5));

ss=sqrt(-x.^2 + 4*y.^2);
ss(imag(ss)~=0) = NaN;

mu = -y - ss; 
mux = -4* x.* y - 2* x.*ss - y.*e; 
muy = -x.^2 - y.^2 + 2*y.*ss;

pl(6)=mesh(mu,mux,muy);

ss=-ss;
mu = -y - ss; 
mux = -4* x.* y - 2* x.*ss - y.*e; 
muy = -x.^2 - y.^2 + 2*y.*ss;

pl(7)=mesh(mu,mux,muy);

%}

%% 

%% Surface parametrisation in mu and x 
% a =mu, b=mux, c=muy

muu = linspace(-0.8,0.8,100);
xx = linspace(-0.5,0.5,100);
[mu,x] = meshgrid(muu,xx);

ss =  sqrt(8*mu.^2 + 3*x.*(2*x + e));
ss(imag(ss)~=0) = NaN;

a = mu;
b = 1/6*(mu.*(8*x-2*e)+sqrt(2)*(2*x+e).*ss);
c = 1/6*(-14*mu.^2-3*x.*(4*x+e)+4*sqrt(2)*mu.*ss);

a(a>axlims(2) | a < axlims(1))=NaN;
b(b>axlims(4) | b < axlims(3))=NaN;
c(c>axlims(6) | c < axlims(5))=NaN;

pl(8)=surf(a,b,c);
hold on

ss = -ss;
b = 1/6*(mu.*(8*x-2*e)+sqrt(2)*(2*x+e).*ss);
c = 1/6*(-14*mu.^2-3*x.*(4*x+e)+4*sqrt(2)*mu.*ss);

a(a>axlims(2) | a < axlims(1))=NaN;
b(b>axlims(4) | b < axlims(3))=NaN;
c(c>axlims(6) | c < axlims(5))=NaN;

pl(9)=surf(a,b,c);

%% inner cusp line



muu = linspace(-1,0.4);

y=1/24*(8*muu + (64*muu.^2 - 3*e^2)./(512*muu.^3 - 24*muu*e^2 + sqrt(3)*sqrt((64*muu.^2*e - 3*e^3).^2)).^(1/3)... 
                + (512*muu.^3 - 24*muu*e.^2 + sqrt(3)*sqrt((64*muu.^2*e - 3*e^3).^2)).^(1/3));

y(imag(y)~=0) = NaN;
mu = muu;
            
ss = sqrt(-mu.^2-2*mu.*y + 3*y.^2 + e^2/16);
ss(imag(ss)~=0) = NaN;
a = mu;
b = 1/2*(y.*(4*ss-e)-mu.*(4.*ss+e));
c = -2*mu.*y-3*y.^2-1/16*(4*ss + e).^2;

a(a>axlims(2) | a < axlims(1))=NaN;
b(b>axlims(4) | b < axlims(3))=NaN;
c(c>axlims(6) | c < axlims(5))=NaN;

pl(3) = plot3(a,b,c);


%% outer cusp lines

mu = linspace(-1,0,200);
y = 1/12*(4*mu - sqrt(64*mu.^2 - 3*e.^2));
y(imag(y)~=0) = NaN;
            
%ss = sqrt(-mu.^2-2*mu.*y + 3*y.^2 + e^2/16);
%ss(imag(ss)~=0) = NaN;
ss=0;
a = mu;
b = 1/2*(y.*(4*ss-e)-mu.*(4.*ss+e));
c = -2*mu.*y-3*y.^2-1/16*(4*ss + e).^2;

a(a>axlims(2) | a < axlims(1))=NaN;
b(b>axlims(4) | b < axlims(3))=NaN;
c(c>axlims(6) | c < axlims(5))=NaN;

pl(4) = plot3(a,b,c);


mu = linspace(0,1,200);
y = 1/12*(4*mu + sqrt(64*mu.^2 - 3*e.^2));
y(imag(y)~=0) = NaN;
            
ss=0;
a = mu;
b = 1/2*(y.*(4*ss-e)-mu.*(4.*ss+e));
c = -2*mu.*y-3*y.^2-1/16*(4*ss + e).^2;

a(a>axlims(2) | a < axlims(1))=NaN;
b(b>axlims(4) | b < axlims(3))=NaN;
c(c>axlims(6) | c < axlims(5))=NaN;

pl(5) = plot3(a,b,c);

%% bifurcation points

mu = sqrt(3)/8*e;
ss=0;
y = 1/12*(4*mu);
a = mu;
b = 1/2*(y.*(4*ss-e)-mu.*(4.*ss+e));
c = -2*mu.*y-3*y.^2-1/16*(4*ss + e).^2;

pl(10) = plot3(a,b,c,'*');

mu = -mu;

y = 1/12*(4*mu);
a = mu;
b = 1/2*(y.*(4*ss-e)-mu.*(4.*ss+e));
c = -2*mu.*y-3*y.^2-1/16*(4*ss + e).^2;

a(a>axlims(2) | a < axlims(1))=NaN;
b(b>axlims(4) | b < axlims(3))=NaN;
c(c>axlims(6) | c < axlims(5))=NaN;

pl(11) = plot3(a,b,c,'*');



%%
axis(axlims*0.9)
view([-61 21])
ax=gca;
ax.XTickLabel={}; ax.YTickLabel={}; ax.ZTickLabel={};
for j=1:length(pl)
   if(isa(pl(j), 'matlab.graphics.chart.primitive.Surface'))
    pl(j).LineStyle='none' ;
    pl(j).EdgeColor=0.4*[1 1 1];
    pl(j).FaceAlpha=0.9;
    
   end
   if(isa(pl(j), 'matlab.graphics.chart.primitive.Line'))
       pl(j).LineWidth=7;
       pl(j).Color='k';
   end
end

pl(10).MarkerSize=30;
pl(11).MarkerSize=30;

view([-58.7333 22.2])
%axis vis3d
% c1=camlight('right');
%  c2=camlight('headlight');
% c2.Color=0*[1 1 1];
% material metal
colormap('gray')
%%
%%{
title('D_4^+')
xl=xlabel('\mu_1');
yl=ylabel('\mu_2');
zl=zlabel('\mu_3');
ax.FontSize=30;
%}