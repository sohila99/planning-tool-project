function [traffic_intensity_per_cell,traffic_intensity_per_sector]=traffic_intensity(GOS,no_of_sectors,cluster_size)
S=340;

C_cell=floor(S/cluster_size);
C=floor(C_cell/no_of_sectors); % number of channels per sector

for A=1:1000 %for loop to get close value to traffic intensity to use it in fzero
    Pr= (A^C/factorial(C))/sum(A.^([0:C])./cumprod([0,0:C-1]+1));
    if GOS<=Pr
     break
    end
end

Erlang = @(A1) (A1^C/factorial(C))/sum(A1.^([0:C])./cumprod([0,0:C-1]+1));
traffic_intensity_per_sector = fzero(@(A1) Erlang(A1)-GOS, A); 

traffic_intensity_per_cell=traffic_intensity_per_sector*no_of_sectors;
end