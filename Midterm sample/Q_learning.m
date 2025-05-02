function [opt_a,Wt,J]= Q_learning(a,W,robot,goal,laser,R,terminal)

epsilon = 0.3;
dt = 0.1;
gamma = 0.8;
alpha = 0.05;

if rand < epsilon
    opt_a = randi(5);
else
    q_vals = zeros(1, 5);
    for i = 1:5
        q_vals(i) = dot(W, features(robot, goal, laser, i));
    end
    [~, max_idx] = max(q_vals);
    opt_a = max_idx;
    %disp(opt_a);
end

robot_next = motion_model(robot,a,dt);
q_next = zeros(1, 5);
for i = 1:5
    q_next(i) = q_value(i,W,robot_next,goal,laser);
    
end
%disp(q_next);
if terminal
    td_target = R;
else
    td_target = R + gamma * max(q_next);
end

q_current = dot(W, features(robot, goal, laser, a));
td_error = td_target - q_current;

%disp(W);
Wt = W + alpha * td_error .* features(robot,goal,laser,a);
J=0;
%% WRITE YOUR CODE HERE