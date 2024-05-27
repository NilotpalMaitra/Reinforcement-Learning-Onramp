obsInfo = rlNumericSpec([6 1]);
actInfo = rlNumericSpec([2 1],"UpperLimit",1,"LowerLimit",-1);

env = rlSimulinkEnv("whrobot","whrobot/controller",obsInfo,actInfo);
env.ResetFcn = @randomstart;

learnopts = rlOptimizerOptions("LearnRate",5e-5,"GradientThreshold",10)
agentopts = rlDDPGAgentOptions("SampleTime",0.25,"ExperienceBufferLength",1e6,"MiniBatchSize",128)
agentopts.ActorOptimizerOptions = learnopts;
agentopts.CriticOptimizerOptions = learnopts
agent = rlDDPGAgent(obsInfo,actInfo,agentopts)
