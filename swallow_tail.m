% Illustration breaking of A4 - swallow tail

% @author  Christian Offen
% @version 1.0

xx = linspace(-0.4,0.4,50);
cc = linspace(-0.2,0.1,50);
[x,c] = meshgrid(xx,cc);

figure(); hold on; xlabel('a'); ylabel('b'); zlabel('c'); grid on; view(3);
title('Level bifurcation surface of the swallow tail A_4');

b = -3*c.*x-10*x.^3;
a = x.*(-2*b+x.*(-3*c-5*x.^2));
h=surf(a,b,c);

view([-97.33 -60.933])
axis([ -0.0102    0.0569   -0.0663    0.0587   -0.2000    0.1500])
h.LineStyle='none';
%% print
title('')
orient landscape
axis off
% set(gca,'FontSize',20);
% print('swallow_tail.pdf','-dpdf','-fillpage')