obsInfo = rlFiniteSetSpec(0:20);
actInfo = rlFiniteSetSpec(1:5);
slEnv = rlSimulinkEnv("targetDice","targetDice/RL die chooser",obsInfo,actInfo);
criticopts = rlOptimizerOptions("LearnRate",0.001,"GradientThreshold",1)
agopts = rlDQNAgentOptions("DiscountFactor",1)
agopts.CriticOptimizerOptions = criticopts
agopts.EpsilonGreedyExploration.EpsilonDecay = 0.001
agent = rlDQNAgent(obsInfo,actInfo,agopts)
