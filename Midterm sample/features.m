function [f]= features(robot,goal,laser,a)

dt = 0.1;


next_state = motion_model(robot,a,dt);
move_vec = [cos(next_state.t), sin(next_state.t)];
goal_vec = [goal.x - robot.x, goal.y - robot.y];
if norm(goal_vec) > 0
    goal_vec = goal_vec / norm(goal_vec);
end
cos_angle = dot(move_vec, goal_vec);
cos_angle = min(max(cos_angle, -1), 1);  % Clamp for safety
f3 = acos(cos_angle);

f1 = 1;
f2 = norm([goal.x-next_state.x, goal.y-next_state.y])/100;
%f3 = next_state.t - atan2(goal.y - next_state.y, goal.x - next_state.x);
if laser(a) <= 70
    f4 = f3;
else
    f4 = -f3;
end
disp(f3);
[f] = [f1; f2; f3; f4];
%% WRITE YOUR CODE HERE

