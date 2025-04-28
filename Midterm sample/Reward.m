function [R,Terminal]= Reward(robot,goal)

%% WRITE YOUR CODE HERE
R=-0.05;
Terminal=0;

if (robot.x<=5) || (robot.x>=295) || (robot.y<=5) || (robot.y>=295)
    Terminal=1;
    R=-1*10;    

elseif norm([goal.x-robot.x, goal.y-robot.y]) <= 10
    Terminal=1;
    R=1*10; 

elseif (robot.x < 160 && robot.x > 140) && (robot.y > 135 && robot.y < 165)
    Terminal=1;
    R=-1*10;

elseif (robot.x < 170 && robot.x > 130) && (robot.y > 145 && robot.y < 155)
    Terminal=1;
    R=-1*10;

elseif norm([140-robot.x, 145-robot.y]) <= 10 || norm([140-robot.x, 155-robot.y]) <= 10 || norm([160-robot.x, 155-robot.y]) <= 10 || norm([160-robot.x, 135-robot.y]) <= 10
    Terminal=1;
    R=-1*10; 

else
    R=-0.05;


end
