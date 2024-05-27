%command window 


initializemodel('whrobot')
>> load robotmodel
>> env.ResetFcn = @randomstart;
>> save robotmodel

MATLAB code-

rng(123) % for reproducibility
load robotmodel

agent
env
opts = rlSimulationOptions
opts = rlSimulationOptions("MaxSteps",100,"NumSimulations",5);
simout = sim(agent,env,opts)
