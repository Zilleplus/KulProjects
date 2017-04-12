function [ numerical_sol,exact_sol ] = ex3_1_simulate( init_position,...
                                        delta_t, num_of_points, ...
                                        lambda,mu ...
                                    )
    anal_solution = @(W,t) init_position*exp((lambda-mu^2/2)*t+mu*W);
    
    delta_W = randn(num_of_points,1).*sqrt(delta_t);
    numerical_sol=zeros(num_of_points,1);numerical_sol(1,1)=init_position;
    exact_sol=zeros(num_of_points,1);exact_sol(1,1)=init_position;
    
    for point_index=2:num_of_points
        numerical_sol(point_index,1) = ...
            numerical_sol(point_index-1,1) ...
            + lambda*numerical_sol(point_index-1,1)*delta_t ...
            + mu*numerical_sol(point_index-1,1)*delta_W(point_index);
        
        exact_sol(point_index,1) = anal_solution(delta_W(point_index),...
            (point_index-1)*delta_t);
    end
end

