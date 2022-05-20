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
figure
plot(cell_radius,userDensity)
grid on

%PART (5)
SIRmin = 19;
figure
semilogx(userDensity,no_of_cells)
grid on
figure
plot(cell_radius,userDensity)
grid on
