function[M] = initializeMatrix(parameters)

%This function initializes the grid on which the simulation run.
%First all sites contain a zero.

sideLength=parameters.sideLength;
M = zeros(sideLength,sideLength);
end