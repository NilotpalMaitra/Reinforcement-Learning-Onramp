load simresults

simout

s = simout(1)
t = s.Reward.Time;
r = s.Reward.Data;
plot(t,r)
figure
hold on 
for k = 1:10 
    s = simout(k);
    t = s.Reward.Time;
    r = s.Reward.Data;
    plot(t,r)
end 
hold off
