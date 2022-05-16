%part a

%Givens (total number of channels is S, the frequency in MHz is fMHz, BSh is the Base Station height in meters,
% MSh is the Mobile Station height in meters, Rxmin is the MS sensitivity in dBm, traffic is the traffic intensity
%per user in Erlang,and n is the path loss exponent)

S = 340;
fMHz = 900;
BSh = 20;
MSh = 1.5;
Rxmin = -95;
trafficUser = 0.025;
n = 4;

%inputs to get from the user

GOS = input('Enter the GOS ');
cityArea = input('Enter the city area (in square kilometers) ');
userDensity = input('Enter the user denisty (number of users in the given city area in users per square kilometer) ');
SIRmin = input('Enter the minimum SIR in dB');
sectorMethod = input('Enter the sectorization method (0 for omnidirectional, 1 for 120 degrees sectoring, and 2 for 60 degrees sectoring) ');

%Calculations

%converting SIR from dB to ratio

SIRratio = 10^(SIRmin*0.1);

%calculating the number of interfering channels i according to the sectorization method used

if sectorMethod == 0
	i = 6;
elseif sectorMethod == 1
	i = 2;
elseif sectorMethod == 2
	i = 1;
else errordlg('Please enter 0 for omnidirectional, 1 for 120 degrees sectoring, and 2 for 60 degrees sectoring','Error')
end

%cluster size
%generate an array B of frequency reuse factor possible values
X=zeros(1,1000);
c=0;
for j = 0:10
    for k = 1:10
       m = (j^2)+(j*k)+(k^2);
       c=c+1;
       X(1, c) = [m];
       B=sort(unique(X));
    end
end

%calculate cluster size N from the given SIR(dB) and according to the number of interfering channels
N_more_or_eq=(1/3)*(i*10^(SIRmin/10))^(2/n);  
N = B( find ( B >= N_more_or_eq, 1));

%number of channels per cell

C = S/N;

%total traffic intensity

U = userDensity*cityArea;
A = trafficUser*userDensity;
