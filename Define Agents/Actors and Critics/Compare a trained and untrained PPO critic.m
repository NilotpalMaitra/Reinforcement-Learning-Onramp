obsInfo = rlFiniteSetSpec(0:20);
actInfo = rlFiniteSetSpec(1:5);
slEnv = rlSimulinkEnv("targetDice","targetDice/RL die chooser",obsInfo,actInfo);
slEnv.ResetFcn = @randomizeseed;

%Visualize critic values
numexp = 50;

%Trained agent from file
load trainedPPO.mat
criticpredictions(agent,slEnv,numexp)
title("Trained critic")
%New default agent
agent = rlPPOAgent(obsInfo,actInfo);
criticpredictions(agent,slEnv,numexp)
title("Untrained critic")

%Local functions
%Randomize the random number seed in the Simulink model.
function simin = randomizeseed(simin)
simin = setVariable(simin,"seed",randi(1e5),"Workspace","targetDice");
end

function criticpredictions(agent,env,numexp)
% Extract critic network from agent
critic = getCritic(agent);
net = getModel(critic);
% Get critic's values for all observations
targs = 1:20;
vals = predict(net,dlarray(targs,"CB")); % convert targets into a dlarray
vals = -extractdata(vals);  % Get results back as numeric matrix
% [Value = -(expected number of dice rolls)]

% Do simulations to compare
simout = sim(agent,env,rlSimulationOptions("MaxSteps",20,"NumSimulations",numexp));
% First element of the observations is the starting target value
t = arrayfun(@(s) s.Observation.obs1.Data(1),simout);
% Number of actions = number of dice rolls taken
n = arrayfun(@(s) numel(s.Action.act1.Time),simout);

% Visualize the results
boxchart(t,n)
hold on
plot(targs,vals)
hold off
xlabel("Target")
ylabel("Average number of rolls")
legend("Actual","Predicted by critic","Location","northwest")
end
