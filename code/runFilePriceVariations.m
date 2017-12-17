%This is the main script. Here we run our Experiments

%%List of parameters
parameters.sideLength = 70; %Length of matrix. One gets L^2 sites in the simulation
parameters.price = 0.1; %Price for the product
parameters.resistivity = 0.5; %Ressistivity to price. E.g r=1 means rich people r = 0; ultra poor people
parameters.seeds = 90; %amount of seeds in the matrix, which contain a one. Sites are picked randomly.
parameters.nnCondition = 'moore'; %One can choose between Von Neumann ="vonNeumann", Moore "moore" nearest neighbor interaction
                                 %Or "randomNetwork" to choose 4 neighbors by random out of the lattice
parameters.progressInSimulation = 0; % The progress in simulation, a normalised time measure. progress = actual step/steps





steps = 1000000;
h = waitbar(0,'Simulating...');
counter = 0;

for price = 0.1:0.1:1 
    counter = counter +1;
    waitbar(1/10*counter)
    
    parameters.price = price;
    Results(counter).price = price;
    Results(counter).environment =  'moore';
    Results(counter).numberOfSeeds = parameters.seeds;
    
    SumFractionOfOwners = zeros(1,steps);
    SumProbabilities = zeros(1,steps);
 
for k = 1:20


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

    SumFractionOfOwners = SumFractionOfOwners + fractionOfOwners;
    SumProbabilities = SumProbabilities + probability;


end
Results(counter).fractionOfOwners = SumFractionOfOwners/20;
Results(counter).probability = SumProbabilities/20;
end
close(h)