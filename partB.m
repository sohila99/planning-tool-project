%PART B (1)
SIRmin = 1:30;
figure
semilogx(SIRmin,B(1, 1:30))
grid on
title('Cluster Size VS SIR [dB]')
xlabel('Cluster Size')
ylabel('SIR [dB]')

%PART B (2)
Y=[];
X=[];
SIRmin = 19;
for GOS=.01:.01:.3

for A=1:1000 %for loop to get close value to traffic intensity to use it in fzero
    Pr= (A^C/factorial(C))/sum(A.^([0:C])./cumprod([0,0:C-1]+1));
    if GOS<=Pr
     break
    end
end

Erlang = @(A1) (A1^C/factorial(C))/sum(A1.^([0:C])./cumprod([0,0:C-1]+1));
traffic_intensity_per_sector = fzero(@(A1) Erlang(A1)-GOS, A);

traffic_intensity_per_cell=traffic_intensity_per_sector*no_of_sectors;

%total number of cells
traffic_intensity_total = traffic_per_User * userDensity * cityArea;
no_of_cells = traffic_intensity_total/traffic_intensity_per_cell;
Y=[Y ,no_of_cells];
X = [X, traffic_intensity_per_cell];
end
gos = 0.01:0.01:0.3;
figure
plot(Y,gos)
grid on
title("Numb. of Cells vs GOS");
xlabel("Number of Cells"); ylabel("GOS [Grade of Service]");

figure
plot(X,gos)
grid on
title("Traff. Intensity per Cell vs GOS");
xlabel("Traffic Int. Per Cell"); ylabel("GOS [Grade of Service]");

%PART B (3)
SIRmin = 14;
F = [];
H = [];
for GOS=0.01:0.01:0.3

for A=1:1000 %for loop to get close value to traffic intensity to use it in fzero
    Pr= (A^C/factorial(C))/sum(A.^([0:C])./cumprod([0,0:C-1]+1));
    if GOS<=Pr
     break
    end
end

Erlang = @(A1) (A1^C/factorial(C))/sum(A1.^([0:C])./cumprod([0,0:C-1]+1));
traffic_intensity_per_sector = fzero(@(A1) Erlang(A1)-GOS, A);

traffic_intensity_per_cell=traffic_intensity_per_sector*no_of_sectors;

%total number of cells
traffic_intensity_total = traffic_per_User * userDensity * cityArea;
no_of_cells = traffic_intensity_total/traffic_intensity_per_cell;
F=[F ,no_of_cells];
H=[H ,traffic_intensity_per_cell];
end
figure
plot(F,gos)
grid on
title("Numb. of Cells vs GOS");
xlabel("Number of Cells"); ylabel("GOS [Grade of Service]");

figure
plot(H,gos)
grid on
title("Traff. Intensity per Cell vs GOS");
xlabel("Traffic Int. Per Cell"); ylabel("GOS [Grade of Service]");

%PART B (4)
SIRmin = 14;
GOS = 0.2;
userDensity = 100:10:2000
%Total number of Cells
traffic_intensity_total = traffic_per_User * userDensity * cityArea;
no_of_cells = traffic_intensity_total/traffic_intensity_per_cell;
%Cell Radius
cell_area=cityArea./no_of_cells;
cell_radius=sqrt(cell_area/(1.5*sqrt(3)));
figure
semilogx(userDensity,no_of_cells)
grid on
title('# Of Cells vs User Density [users/area] SIRmin = 14dB and GOS = 2%');
xlabel('Number of Total Cells In Area');
ylabel('User Density')'
figure
plot(cell_radius,userDensity)
grid on
title('Cell Radius [Km] vs User Density SIRmin = 14dB and GOS = 2%');
xlabel('Cell Radius [Km]');
ylabel('User Density [users/area]');

%PART B (5)
SIRmin = 19;
figure
semilogx(userDensity,no_of_cells)
grid on
title('Number of Cells vs User Density at SIRmin = 19dB and GOS = 2%');
xlabel('User Density');
ylabel('Number of Cells');
figure
plot(cell_radius,userDensity)
grid on
title('Cell Radius [Km] vs User Density at SIRmin = 19dB and GOS = 2%');
xlabel('Cell Radius [Km]');
ylabel('User Density');
