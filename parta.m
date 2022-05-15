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
sectorMethod = input('Enter the sectorization method (0 for omnidirectional, 1 for 60 degrees sectoring, and 2 for 120 degrees sectoring) ');

%Calculations

%converting SIR from dB to ratio

SIRratio = 10^(SIRmin*0.1);

%calculating the reuse distance according to the sectorization method used

if sectorMethod == 0
	reuseDist = (6*SIRmin)^(0.25)+1;
	sectorsNumber == 1;
elseif sectorMethod == 1
	reuseDist = (SIRmin)^(0.25)+1;
	sectorsNumber = 6;
elseif sectorMethod == 2
	reuseDist = (2*SIRmin)^(0.25)+1;
	sectorsNumber = 3;
else errordlg('Please enter 0 for omnidirectional, 1 for 60 degrees sectoring, and 2 for 120 degrees sectoring','Error')
end

%generate an array B of frequency reuse factor possible values
A=zeros(1,c);
c=0;
for i = 0:10
    for k = 1:10
       m = (i^2)+(i*k)+(k^2);
       c=c+1;
       A(1, c) = [m];
       B=sort(unique(A));
    end
end

%calculate cluster size N from the given SIRmin(dB)
N_more_or_eq=(1/3)*(i*10^(SIRmin/(n*10)))^2; 
N = B( find ( B > N_more_or_eq, 1));
	


%total traffic intensity
U = userDensity*cityArea;
A = trafficUser*userDensity;


    
