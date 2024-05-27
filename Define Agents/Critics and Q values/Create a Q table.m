load environment
d
T = rlTable(obsInfo,actInfo)
Qvals= T.Table
randQvals = rand(21,5)
T.Table = randQvals
critic = rlQValueFunction(T,obsInfo,actInfo)
agent = rlQAgent(critic)
[n,win] = playdice(agent,slEnv)
