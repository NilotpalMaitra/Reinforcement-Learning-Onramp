obsInfo = rlFiniteSetSpec(0:20);
actInfo = rlFiniteSetSpec(1:5);
slEnv = rlSimulinkEnv("targetDice","targetDice/RL die chooser",obsInfo,actInfo);

load trainedDQN
critic = getCritic(agent);
trainednet = getModel(critic);

agent = rlDQNAgent(obsInfo,actInfo);
critic = getCritic(agent);
defaultnet = getModel(critic)

layers = defaultnet.Layers
fc = layers(2)
fctrained = trainednet.Layers(2)
wd = fc.Weights
wt = fctrained.Weights

%Local functions
%Visualize the Q-table representation of an agent.

function visualizeQ(net)
% Get Q values (one for each action) for each observation
Q = predict(net,dlarray(1:20,"CB")); % convert targets into a dlarray
Q = extractdata(Q)';  % Get results back as numeric matrix and flip
[no,na] = size(Q);
% Visualize result
imagesc(Q)
colorbar
xticks(1:na)
yticks(1:no)
xlabel("Action (choice of die)")
ylabel("Observation (target value)")
% Add policy to the plot
[~,idx] = max(Q,[],2);
hold on
plot(idx,1:no,"kx")
hold off
end
