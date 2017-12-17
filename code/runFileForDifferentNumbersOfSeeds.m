%This is the main script. Here we run our Experiments

%%List of parameters
parameters.sideLength = 70; %Length of matrix. One gets L^2 sites in the simulation
parameters.price = 0.1; %Price for the product
parameters.resistivity = 0.5; %Ressistivity to price. E.g r=1 means rich people r = 0; ultra poor people
parameters.seeds = 3; %amount of seeds in the matrix, which contain a one. Sites are picked randomly.
parameters.nnCondition = 'moore'; %One can choose between Von Neumann ="vonNeumann", Moore "moore" nearest neighbor interaction
                                 %Or "randomNetwork" to choose 8 neighbors by random out of the lattice
parameters.progressInSimulation = 0; % The progress in simulation, a normalised time measure. progress = actual step/steps





steps = 1000000;
h = waitbar(0,'Simulating...');
counter = 0;



for d = 0:30:150
counter = counter +1
waitbar(1/6*counter) 
Results(counter).numberOfSeeds =  d;
parameters.seeds = d;
SumfractionOfOwners = zeros(1,steps);
Sumprobability = zeros(1,steps);

for averaging = 1:10;
averaging     
M = initializeMatrix(parameters);
M = seedProductOwner(M,parameters);
fractionOfOwners = zeros(1,steps);
probability = zeros(1,steps);


for i = 1:steps
  parameters.progressInSimulation = i/steps; %Adjust this parameter to measure time evolution
  fractionOfOwners(i) = getFractionOfOwners(M,parameters);
  [M,p] = simulateOneStep(M,parameters);
  probability(i)=p;
  
end

SumfractionOfOwners = SumfractionOfOwners + fractionOfOwners;
Sumprobability = Sumprobability + probability;
end

Results(counter).fractionOfOwners = SumfractionOfOwners/10;
Results(counter).probability = Sumprobability/10;
end

close(h)