% Illustration fold bifurcation

t=linspace(-1,1);
t2=linspace(-1/2,1/2);

l=plot(t.^2,t);
l.LineWidth=20;

% uncomment the following two lines for pitchfork bifurcation
hold on
l2=plot(t,0*t);
l2.LineWidth=20;



%plot(t.^3,-t.^2,'b','LineWidth',3)


%xlabel('parameter')
%ylabel('solution')
%ylabel('parameter')
xlabel('$\mu_1$','Interpreter','Latex')
ylabel('$z$','Interpreter','Latex')
ax=gca;
ax.XTickLabel={};
ax.YTickLabel={};
ax.FontSize = 60;

hold on

p=plot(0,0,'*');
p.MarkerSize=50;
p.LineWidth=8;
p.Color='k';
grid on

orient landscape
%print('fold_illustration_landscape','-dpdf','-fillpage')

