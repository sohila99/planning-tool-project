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
userDensity = input('Enter the user denisty (number of users in the given city area) ');
SIRmin = input('Enter the minimum SIR ');
sectorMethod = input('Enter the sectorization method (0 for omnidirectional, 1 for 60 degrees sectoring, and 2 for 120 degrees sectoring) ');


if sectorMethod == 0
	sectorsNumber == 1;
elseif sectorMethod == 1
	sectorsNumber = 6;
elseif sectorMethod == 2
	sectorsNumber = 3;
else errordlg('Please enter 0 for 60 degrees sectoring and 1 for 120 degrees sectoring','Error')
end
	

%Hata Model Calculations

CH = 0.8 + (1.1*log(fMHz)-0.7)*MSh - 1.56*log(fMHz); %CH value for medium-sized urban city