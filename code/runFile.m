%This is the main script. Here we run our Experiments

%%List of parameters
parameters.sideLength = 70; %Length of matrix. One gets L^2 sites in the simulation
parameters.price = 0; %Price for the product
parameters.resistivity = 1; %Ressistivity to price. E.g r=1 means rich people r = 0; ultra poor people
parameters.seeds = 50; %amount of seeds in the matrix, which contain a one. Sites are picked randomly.
parameters.nnCondition = 'moore'; %One can choose between Von Neumann ="vonNeumann", Moore "moore" nearest neighbor interaction
                                 %Or "randomNetwork" to choose 4 neighbors by random out of the lattice
parameters.progressInSimulation = 0; % The progress in simulation, a normalised time measure. progress = actual step/steps





steps = 200000;
h = waitbar(0,'Simulating...');
i = 0;

 



M = initializeMatrix(parameters);
M = seedProductOwner(M,parameters);
%fractionOfOwners = zeros(1,steps);
%probability = zeros(1,steps);

figure
imagesc(M)
xlabel({strcat('- matrix after-', num2str(i),'-steps');'- moore environment'})


v = VideoWriter('moore_environment.avi');
open(v);

for i = 1:steps
  waitbar(1/steps*i)
  parameters.progressInSimulation = i/steps; %Adjust this parameter to measure time evolution
  %fractionOfOwners(i) = getFractionOfOwners(M,parameters);
  [M,p] = simulateOneStep(M,parameters);
  %probability(i)=p;
  if mod(i,800)==0
      imagesc(M) 
      xlabel({strcat('- matrix after -',  num2str(i) ,'- steps');'- moore environment'})
      drawnow
      
      frame = getframe(gcf);
      writeVideo(v,frame);
      
  end

  
end


close(v)
close(h)