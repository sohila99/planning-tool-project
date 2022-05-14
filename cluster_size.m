%part A.1

%generate a set of frequency reuse factor possible values
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

sectorization = 1;
%number of interfering channels (i) according to sectorization method
if sectorization == 0 %omnidirectional
    i = 6;
else if sectorization == 1 %60 degrees sectorization
        i = 2;
    else if sectorization == 2 %120 degrees sectorization
            i = 1;
        end
    end
end


SIR=20;
n=4; %path loss exponent
%calculate N from the given SIR(dB)
N_more_or_eq=(1/3)*(i*10^(SIR/(n*10)))^2;
N = B( find ( B > N_more_or_eq, 1));