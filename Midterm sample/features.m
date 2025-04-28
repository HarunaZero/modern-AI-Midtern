function [f]= features(robot,goal,laser,a)

dt = 0.1;
VW.v=3*5;
if a==3
    VW.w=0;
elseif a== 5
    VW.w = -0.522;
elseif a== 4
    VW.w = -0.261;
elseif a== 2
    VW.w = 0.261;
elseif a== 1
    VW.w = 0.522;
end

next_state.x = robot.x+VW.v*cos(robot.t)*dt;
next_state.y = robot.y+VW.v*sin(robot.t)*dt;

f1 = 1;
f2 = norm([goal.x-next_state.x, goal.y-next_state.y])/100;
f3 = robot.t - atan((goal.x-next_state.x)/(goal.y-next_state.y));
if min(laser) < 70
    f4 = f3;
else
    f4 = -f3;
end

[f] = [f1 f2 f3 f4];
%% WRITE YOUR CODE HERE

