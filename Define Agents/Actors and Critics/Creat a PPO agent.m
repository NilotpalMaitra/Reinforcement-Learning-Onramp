obsInfo = rlFiniteSetSpec(0:20);
actInfo = rlFiniteSetSpec(1:5);
slEnv = rlSimulinkEnv("targetDice","targetDice/RL die chooser",obsInfo,actInfo);
agent = rlPPOAgent(obsInfo,actInfo)

actor = getActor(agent)
critic = getCritic(agent)
cnet = getModel(critic)
clayers = cnet.Layers
anet = getModel(actor)
alayers = anet.Layers

%Local functions
%Visualize the values of the critic and action probabilities of the actor.
function visualizepolicy(net)
% Get Q values (one for each action) for each observation
prob = predict(net,dlarray(1:20,"CB")); % convert targets into a dlarray
prob = extractdata(prob);  % Get results back as numeric matrix and flip
[na,no] = size(prob);
% Visualize result
imagesc(prob)
colorbar
xticks(1:no)
yticks(1:na)
ylabel("Probability of taking action")
xlabel("Observation (target value)")
% Add policy to the plot
[~,idx] = max(prob,[],1);
hold on
plot(1:no,idx,"kx")
hold off
end

function visualizevalue(critic)
t = 1:20;  % Target values
val = predict(critic,dlarray(t,"CB")); % convert targets into a dlarray
val = extractdata(val);  % Get results back as numeric matrix
% Plot results
plot(t,val,"o-")
xlabel("Observation")
ylabel("Value")
title("Value function (critic)")
end
