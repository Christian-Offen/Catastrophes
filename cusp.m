%% Cusp

mu2 = linspace(-1,1);
x = linspace(-1,1);

[Mu2,X] = meshgrid(mu2,x);

Mu1 = 4*X.^3+2*Mu2.*X;

S = surf(Mu1,Mu2,X);
xl = xlabel('\mu_1');
yl = ylabel('\mu_2');
zl = zlabel('\mu_3');


%% Styling

material shiny
%camlight headlight

S.FaceAlpha = 0.7;
S.EdgeColor = 'none';
S.FaceColor = [0.1 0.1 0.8];
axis([-2 2 -1 1 -1 1])
hold on
pt = plot3(0,0,0,'*');
pt.MarkerSize = 40;
pt.LineWidth = 8;
pt.Color = 'k';
a=gca;
a.XTickLabel = {};
a.YTickLabel = {};
a.ZTickLabel = {};
a.FontSize=20;
view([-12 51])


