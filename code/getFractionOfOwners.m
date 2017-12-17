function[fractionOfOwners] = getFractionOfOwners(M,parameters)

%This function returns the fraction of product owners in total. The Matrix entries are assumed to be 
%1=Product owner or 0 = not a product owner

N = (parameters.sideLength)^2;
fractionOfOwners = sum(sum(M))/N;
end