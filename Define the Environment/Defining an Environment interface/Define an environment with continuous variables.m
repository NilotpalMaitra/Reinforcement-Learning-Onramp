whos(get_param("whrobot","ModelWorkspace"))
obsDim = [6 1];
obsInfo = rlNumericSpec(obsDim);
actDim = [2 1];
actInfo = rlNumericSpec(actDim,"LowerLimit",-1,"UpperLimit",1);
env = rlSimulinkEnv("whrobot","whrobot/controller",obsInfo,actInfo);
env.ResetFcn = @randomstart;

function in = randomstart(in)
mdl = "whrobot";
in = setVariable(in,"x0",((-1)^randi([0 1]))*(2.5 + 3.5*rand),"Workspace",mdl);
in = setVariable(in,"y0",2.6 + 3.4*rand,"Workspace",mdl);
in = setVariable(in,"theta0",pi*(2*rand-1),"Workspace",mdl);
in = setVariable(in,"v0",randn/3,"Workspace",mdl);
in = setVariable(in,"w0",randn/3,"Workspace",mdl);
end
