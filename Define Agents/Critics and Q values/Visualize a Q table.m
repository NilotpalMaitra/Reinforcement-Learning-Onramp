load premadeagents
critic = getCritic(trainedagent);
T = getModel(critic)

Qvals = T.Table(2:end,:)
imagesc(Qvals)
colorbar
[mxQ,col] = max(Qvals,[],2)
hold on 
plot(col,1:20,"xk")
hold off
