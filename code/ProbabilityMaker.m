function[probability] = ProbabilityMaker(parameters, M, i, j)

%     method = parameters.ProbabilityCalculationMethod;
    
    f = getFractionOfNeighboringOwners(M,i,j,parameters); 
    t = parameters.progressInSimulation;
    z = parameters.price;
%calculate the probability wich decreses in time. The product gets less
%famous with longer time on the market

p1 = 20*(t+0.02)*exp(-15*(t+0.02));
%calculate the probability of the neighbor interaction. It is just a linear
%of all neighbors which are product owner.


p2 = 0.5*f;


%Calculate the probability dependent on the price
    
 % z         ...dimensionless price of the opinion/trend/product
 % tauz      ...Resistence towards a high price (people with more money
 %               have a higher tau, so they buy an expensive product much faster)
    tauz = 1;
    
    p3 = exp(-z ./ tauz); % if we have a price dependency, we add p3 in to the vector p

    
    p = [p1,p2];
    
%     if strcmp(method, 'MultiplicativeProbability')
        probability = prod(p);
%     elseif strcmp(method, 'MinumumAdjustedMultiplicativeProbability')
%         Probability = prod(p) ./ min(p);
%     elseif strcmp(method, 'MaximumAdjustedMultiplicativeProbability')
%         Probability = prod(p) ./ max(p);
%     elseif strcmp(method, 'MultiplicativeProbabilityWithNeglection')
%         p(p < 1e-4) = [];
%         Probability = prod(p);
%     end
end