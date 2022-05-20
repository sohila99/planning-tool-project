%PART B (1)
SIRmin = 1:30;
figure
semilogx(SIRmin,B(1, 1:30))
grid on
title('Cluster Size VS SIR [dB]')
xlabel('Cluster Size')
ylabel('SIR [dB]')

%PART B (2)
%PART B (3)

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
