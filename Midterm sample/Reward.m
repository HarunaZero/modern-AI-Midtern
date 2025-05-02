function [R,Terminal]= Reward(robot,goal,obs)

%% WRITE YOUR CODE HERE
R = -0.05;
Terminal = 0;

dis_goal = norm([goal.x-robot.x, goal.y-robot.y]);
dis_obs = norm([obs.x-robot.x, obs.y-robot.y]);

% if (robot.x<=5) || (robot.x>=295) || (robot.y<=5) || (robot.y>=295)
%     Terminal=1;
%     R=-1*10;    
% 
% elseif norm([goal.x-robot.x, goal.y-robot.y]) <= 10
%     Terminal=1;
%     R=1*10; 
% 
% elseif (robot.x < 160 && robot.x > 140) && (robot.y > 135 && robot.y < 165)
%     Terminal=1;
%     R=-1*10;
% 
% elseif (robot.x < 170 && robot.x > 130) && (robot.y > 145 && robot.y < 155)
%     Terminal=1;
%     R=-1*10;
% 
% elseif norm([140-robot.x, 145-robot.y]) <= 10 || norm([140-robot.x, 155-robot.y]) <= 10 || norm([160-robot.x, 155-robot.y]) <= 10 || norm([160-robot.x, 135-robot.y]) <= 10
%     Terminal=1;
%     R=-1*10; 
% 
% else
%     R=-0.05;Terminal=0;
% end

if (robot.x<=5) || (robot.x>=295) || (robot.y<=5) || (robot.y>=295)
    Terminal=1;
    R=-1*10;    

elseif norm([goal.x-robot.x, goal.y-robot.y]) <= 10
    Terminal=1;
    R=1*10; 

elseif dis_obs <= 10
    Terminal=1;
    R=-1*10;
end

if dis_goal < 200 && dis_goal >= 150
    R = R + 0.1;
elseif dis_goal < 150 && dis_goal >= 50
    R = R + 0.2;
elseif dis_goal >= 200
    R = R - 0.1;
elseif dis_goal < 50    
    R = R + 0.5;
end







