function[M,p] = simulateOneStep(M,parameters)

%choose one site randomly

l = parameters.sideLength;
progressInSimulation = parameters.progressInSimulation;
i = randi(l);
j = randi(l);

%check if the value is already 1. if yes, exit the fundction
if(M(i,j)==1)
    p = 1;
return;
end

%If the site contains a zero, compute if it changes its value to one (buy the product)

%Here calculate the probability p
p = ProbabilityMaker(parameters, M, i, j);

c = rand();
if(p>=c) % accept the action with probability p
M(i,j)=1;
end