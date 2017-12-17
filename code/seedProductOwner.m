function[M] = seedProductOwner(M,parameters);

%This function seeds the number of seeds randomly in the matrix
seeds = parameters.seeds;
l = parameters.sideLength;

%Check if the user has chosen too much seeds (more than matrix seeds)
if(seeds>l^2)
error('you have choosen to much seeds')
end


counter = 0;
      while(counter ~= seeds)
        i = randi(l);
        j = randi(l);
          if(M(i,j)~=1)
            M(i,j)=1;
            counter = counter +1;
          end
      end    
end