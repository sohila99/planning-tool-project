%part A.1

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

%calculate cluster size N from the given SIR(dB)
N_more_or_eq=(1/3)*(i*10^(SIRmin/10))^(2/n); 
N = B( find ( B > N_more_or_eq, 1));
