%part a

%Givens (total number of channels is S, the frequency in MHz is fMHz, hB is the Base Station height in meters,
% hM is the Mobile Station height in meters, Rxmin is the MS sensitivity in dBm, traffic is the traffic intensity
%per user in Erlang,and n is the path loss exponent)

S = 340;
fMHz = 900;
hB = 20;
hM = 1.5;
Rxmin = -95;
traffic_per_User = 0.025;
n = 4;

%inputs to get from the user

GOS = input('Enter the GOS ');
cityArea = input('Enter the city area (in square kilometers) ');
userDensity = input('Enter the user density (number of users in the given city area in users per square kilometer) ');
SIRmin = input('Enter the minimum SIR in dB');
sectorMethod = input('Enter the sectorization method (0 for omnidirectional, 1 for 120 degrees sectoring, and 2 for 60 degrees sectoring) ');

%Calculations

%converting SIR from dB to ratio

SIRratio = 10^(SIRmin*0.1);

%calculating the number of interfering channels i according to the sectorization method used

if sectorMethod == 0
	i = 6;no_of_sectors=1;
elseif sectorMethod == 1
	i = 2;no_of_sectors=3;
elseif sectorMethod == 2
	i = 1;no_of_sectors=6;
else errordlg('Please enter 0 for omnidirectional, 1 for 120 degrees sectoring, and 2 for 60 degrees sectoring','Error')
end

%cluster size
%generate an array B of frequency reuse factor possible values
X=zeros(1,100);
c=0;
for j = 0:10
    for k = 1:10
       m = (j^2)+(j*k)+(k^2);
       c=c+1;
       X(1, c) = [m];
       B=sort(unique(X));
    end
end

%calculate cluster size N from the given SIR(dB) and according to the number of interfering channels i
%There are two models for calculating N
%Rappaport Model
N_more_or_eq=(1/3)*(i*10^(SIRmin/10))^(2/n);  
%Molisch Model
%N_more_or_eq=(1/3)*((i*10^(SIRmin/10))^(1/n)+1)^2;
N = B( find ( B >= N_more_or_eq, 1));

%number of channels per cell

C_cell=floor(S/N);
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

%total number of cells 
traffic_intensity_total = traffic_per_User * userDensity * cityArea;
no_of_cells = traffic_intensity_total/traffic_intensity_per_cell; 

%cell radius
cell_area=cityArea/no_of_cells;
cell_radius=sqrt(cell_area/(1.5*sqrt(3)));

%transmitted power

C=3*10^8;
lambda= C/(fMHz*10^6);
dbreak=(4*hM*hB)/lamda;
Ptxbreak = Rxmin + 20*log(C/(4*pi*fMHz)) -20*log(dbreak);
Ptx = Ptxbreak - 10*n*log(cell_radius/dbreak);            %in dB 

%received power

d=0.001:10;                     
CH = 0.8 + hM * (1.1*log(fMHz) - 0.7) - 1.56*log(fMHz);
PL = 69.55 + 26.16*log(fMHz) - 13.82*log(hB) - CH + (44.9-6.55*log(hB))*log(d);
Prx = Ptx-PL;
PrxdBm = Prx + 30;          
plot(d,PrxdBm)
grid on
title('Received power [dBm] vs distance [km]')
xlabel(' distance  [km]')
ylabel('Received power [dBm]')
