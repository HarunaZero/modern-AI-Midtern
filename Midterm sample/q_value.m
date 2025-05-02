function q = q_value(a,W,robot,goal,laser)
    phi = features(robot,goal,laser,a);
    % q = 0;
    % for i = 1:4
    %     q = q + W(i)*phi(i);
    % end
    q = dot(W,phi);
end

