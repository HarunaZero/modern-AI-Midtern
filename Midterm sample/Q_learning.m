function [opt_a,Wt,J]= Q_learning(a,W,robot,goal,laser,R,terminal)

epsilon = 0.2;
dt = 0.1;
gamma = 0.9;
alpha = 0.1;

if rand < epsilon
    opt_a = randi(5);
else
    q_vals = zeros(1, 5);
    for i = 1:5
        q_vals(i) = q_value(i,W,robot,goal,laser);
    end
    [~, max_idx] = max(q_vals);
    opt_a = max_idx;
end

robot_next = motion_model(robot,a,dt);
q_next = zeros(1, 5);
for i = 1:5
    q_next = q_value(i,W,robot_next,goal,laser);
end

target = Reward(robot_next,goal) + gamma * max(q_next);
td_error = target - (W .* features(robot_next,goal,laser,a));


Wt = W + alpha * td_error .* features(robot_next,goal,laser,a);
J=0;
%% WRITE YOUR CODE HERE