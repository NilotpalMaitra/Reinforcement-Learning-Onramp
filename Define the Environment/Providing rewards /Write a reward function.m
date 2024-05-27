%Visualize reward function for an Episode


% Choose run1 - run5 to try different examples
load run1
%Calculate reward for each time step
nsteps = numel(t);
r = zeros(nsteps,1);
for k = 1:nsteps
    r(k) = rewardfun(obs(:,k),success(k),failure(k));
end
%View results
plot(t,r)


% Reward section 

function r = rewardfun(state,madeit,collided)

x = state(1)/10;
y = state(2)/10;
omega = state(6);

r = 0.05*exp(-8*x^2) + 0.06*exp(-3*y) - 0.14 ...
     - 0.001*omega^2 + 5*madeit - 2*collided;
