obsInfo = rlFiniteSetSpec(0:20);
actInfo = rlFiniteSetSpec(1:5);
slEnv = rlSimulinkEnv("targetDice","targetDice/RL die chooser",obsInfo,actInfo);

agent = rlDQNAgent(obsInfo,actInfo)
critic = getCritic(agent)
net = getModel(critic)
plot(net)
