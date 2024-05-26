rng(123) % for reproducibility
load robotmodel

agent
env

simout = sim(agent,env)
obs = simout.Observation.obs1.Data
obsmat = squeeze(obs)
x = obsmat(1,:);
y = obsmat(2,:);
plot(x,y)
