d = [1 1 1 5 5 8;2 2 3 3 6 6;1 4 4 4 5 7;2 2 6 6 7 8;3 4 5 7 8 8]
states = 0:20
choices = 1:5
obsInfo = rlFiniteSetSpec(states)
actInfo = rlFiniteSetSpec(choices)
slEnv = rlSimulinkEnv("targetDice","targetDice/RL die chooser",obsInfo,actInfo);
load premadeagents
agent =  trainedagent
[n,win] = playdice(agent,slEnv)
