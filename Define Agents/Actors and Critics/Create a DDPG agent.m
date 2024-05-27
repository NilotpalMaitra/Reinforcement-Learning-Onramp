%DDPG is Deep Deterministic Policy gradient agent is an actor-critic agent that can have continuous actions. This makes it suitable for controlling the warehouse robot.

obsInfo = rlNumericSpec([6 1]);
actInfo = rlNumericSpec([2 1],"UpperLimit",1,"LowerLimit",-1);
env = rlSimulinkEnv("whrobot","whrobot/controller",obsInfo,actInfo);
env.ResetFcn = @randomstart;
agent = rlDDPGAgent(obsInfo,actInfo);
actor = getActor(agent)
critic = getCritic(agent)
anet = getModel(actor)
alayers = anet.Layers
cnet = getModel(critic)
plot(cnet)
