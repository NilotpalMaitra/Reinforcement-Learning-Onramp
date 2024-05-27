xl = 8;
L = 1.2;
D = 1.5;
xvec = linspace(-xl,xl);
yvec = linspace(-D,xl);
[xmat,ymat] = meshgrid(xvec,yvec);
x = xmat/10;
y = ymat/10;
r = exp(-8*x.^2) + exp(-3*y);
contourf(xvec,yvec,r)
colorbar
patch([L L xl xl],[-D D D -D],"k");
patch([-xl -xl -L -L],[-D D D -D],"k");
patch([-L -L L L],[3*D xl xl 3*D],"k");
xlim(xl*[-1 1])
ylim([-D xl])
axis equal
