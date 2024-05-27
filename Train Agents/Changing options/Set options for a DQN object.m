obsInfo = rlFiniteSetSpec(0:20);
actInfo = rlFiniteSetSpec(1:5);
slEnv = rlSimulinkEnv("targetDice","targetDice/RL die chooser",obsInfo,actInfo);
criticopts = rlOptimizerOptions("LearnRate",0.001,"GradientThreshold",1)
agopts = rlDQNAgentOptions("DiscountFactor",1)
agopts.CriticOptimizerOptions = criticopts
agopts.EpsilonGreedyExploration.EpsilonDecay = 0.001
agent = rlDQNAgent(obsInfo,actInfo,agopts)


% diceopts = rlTrainingOptions("MaxEpisodes",2000,"MaxStepsPerEpisode",20, ...
%     "ScoreAveragingWindowLength",100,"StopTrainingCriteria","AverageReward","StopTrainingValue",-3);
% info = train(agent,slEnv,diceopts)
% 
% visualizeQ(agent)
function visualizeQ(agent)
net = getModel(getCritic(agent));
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
