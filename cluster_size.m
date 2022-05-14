%part A.1

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

SIRmin=20;
n=4; %path loss exponent
%calculate cluster size N from the given SIR(dB)
N_more_or_eq=(1/3)*(sectorsNumber*10^(SIRmin/(n*10)))^2; 
N = B( find ( B > N_more_or_eq, 1));
