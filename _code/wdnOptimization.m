%Optimization course project: Identifying optimial diameter of pipe in WDN

%clearvars;
rand('state',0);
N=10; %Number of nodes
M=18; %Number of edges
K = 3; % Number of supplier nodes i.e node number 1,2 and 3 
p=N-K; % Number of consumer nodes i.e node number i.e 4....7

dmin = 0.5*ones(M,1); %minimum pipe diameters i.e 1 m (in meter)
dmax = 1.5*ones(M,1); %maximum pipe diameters i.e 1.5 (in meter)

s_max = 20+0.5*randn(K,1); %denote the maximum flow into the WDN from the supply and random 

l = 5*ones(M,1);  %the possible range of pipe lengths (edges) in meters 

c=3+0.5*randn(N-K,N); % Consumer demand and random

% altitudes
h = rand(N,1); %Defining Head losses 
h = sort(h, 'descend'); %Since, as we define h>h' i.e the present head of node i is higher than next node i' so  


edges=[[1 1 1 2 2 2 3 3 4 5 5 6 6 7 7 8 8 9]'... 
       [2 3 4 3 4 6 5 6 7 7 8 7 8 8 9 9 10 10]']; %Defining edges (j) as given in figure (1) of text 

% Defining incidence matrix
A=zeros(N,M);
for j=1:size(edges,1)
    A(edges(j,1),j)=-1;
    A(edges(j,2),j)=1;
end

%define alpha_j as given in equation 9 of text i.e 
alpha_j = (881.54*diag(-A'*h)*(1./l)).^(1/1.852); 

%define d_o: The chosen dimeter for Taylor series approximation
d_o=1.25;

%Apply Optimization
cvx_begin
    variable d(M);
    variable s(K,N);
    variable f(M,N);
    minimize (l'*d);
    subject to
        dmin <= d;
        d <= dmax;
        for i=1:N
            A*f(:,i) == [-s(:,i); c(:,i)];
            f(:,i)- alpha_j(i)*(d_o)^(2.62)-alpha_j(i)*2.62*(d-d_o)<=0;
            f(:,i) >= 0;
            0 <= s(:,i) <= s_max;
        end
cvx_end
c

%plot(y,d)
