d = [1 1 1 5 5 8;2 2 3 3 6 6;1 4 4 4 5 7;2 2 6 6 7 8;3 4 5 7 8 8]
load premadeagents.mat
agent = trainedagent
states = 0:20;
choices = 1:5;
obsInfo = rlFiniteSetSpec(states);
actInfo = rlFiniteSetSpec(choices);
slEnv = rlSimulinkEnv("targetDice","targetDice/RL die chooser",obsInfo,actInfo)

slEnv.ResetFcn = @randomstart
[n,win] = playdice(agent,slEnv)
function siminput = randomstart(siminput)
% siminput = setVariable(siminput,"varname",value,"Workspace","modelname");
siminput = setVariable(siminput,"seed",randi(1e5),"Workspace","targetDice");
end
