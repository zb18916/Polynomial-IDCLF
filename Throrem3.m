clc;
clear;


 I=[1  0;0  1]
%%
%disturbance input
% 
% R1=0.95;
% R2=0.95;
% R12=0.52;
% a1=0.2236;
% a2=0.2582;
% b1=0.4472;
% b2=0.4082;
% 
% A{1}=[-R1*a1-(R12*a1*a2)/((abs(a1^2-a2^2))^0.5)    (R12*a1*a2)/((abs(a1^2-a2^2))^0.5);
%      (R12*a1*a2)/((abs(a1^2-a2^2))^0.5)          -R2*a2-(R12*a1*a2)/((abs(a1^2-a2^2))^0.5)];
% 
% A{2}=[-R1*a1-(R12*a1*b2)/((abs(a1^2-b2^2))^0.5)    (R12*a1*b2)/((abs(a1^2-b2^2))^0.5);
%      (R12*a1*b2)/((abs(a1^2-b2^2))^0.5)          -R2*b2-(R12*a1*b2)/((abs(a1^2-b2^2))^0.5)];
% 
% A{3}=[-R1*b1-(R12*b1*a2)/((abs(b1^2-a2^2))^0.5)    (R12*b1*a2)/((abs(b1^2-a2^2))^0.5);
%      (R12*b1*a2)/((abs(b1^2-a2^2))^0.5)          -R2*a2-(R12*b1*a2)/((abs(b1^2-a2^2))^0.5) ];
% 
% A{4}=[-R1*b1-(R12*b1*b2)/((abs(b1^2-b2^2))^0.5)    (R12*b1*b2)/((abs(b1^2-b2^2))^0.5);
%      (R12*b1*b2)/((abs(b1^2-b2^2))^0.5)          -R2*b2-(R12*b1*b2)/((abs(b1^2-b2^2))^0.5) ];
% 
% 
% B0=I;
% B{1}=B0;
% B{2}=B0;
% B{3}=B0;
% B{4}=B0;
% 
% E0=[0.1  0.2;
%    0.2  0.1];
% E{1}=E0;
% E{2}=E0;
% E{3}=E0;
% E{4}=E0;
% 
% J0=[0.6  0;0  0.5];
% J{1}=J0;
% J{2}=J0;
% J{3}=J0;
% J{4}=J0;
% 
% F0=[0;0];
% F{1}=F0;
% F{2}=F0;
% F{3}=F0;
% F{4}=F0;
% 
% 
% C0=[0.5 0.5];
% C{1}=C0;
% C{2}=C0;
% C{3}=C0;
% C{4}=C0;
% 
% D0=[0.5 0.5];
% D{1}=D0;
% D{2}=D0;
% D{3}=D0;
% D{4}=D0;
% 
% 
% jie_da=1.8;
% jie_xiao=0.6;
% eta=[1;10];
% 
% r=4;
% n=6;
% u=1.01;
% Cst=[];
% % T=0.60
% % t_0=0.3;
% % t_1=0.3
% 
% 
% t_0=0.1;
% t_1=0.6;


%%

% no disturbance input
% R1=0.95;
% R2=0.95;
% R12=0.52;
% a1=0.2236;
% a2=0.2582;
% b1=0.4472;
% b2=0.4082;
% 
% A{1}=[-R1*a1-(R12*a1*a2)/((abs(a1^2-a2^2))^0.5)    (R12*a1*a2)/((abs(a1^2-a2^2))^0.5);
%      (R12*a1*a2)/((abs(a1^2-a2^2))^0.5)          -R2*a2-(R12*a1*a2)/((abs(a1^2-a2^2))^0.5)];
% 
% A{2}=[-R1*a1-(R12*a1*b2)/((abs(a1^2-b2^2))^0.5)    (R12*a1*b2)/((abs(a1^2-b2^2))^0.5);
%      (R12*a1*b2)/((abs(a1^2-b2^2))^0.5)          -R2*b2-(R12*a1*b2)/((abs(a1^2-b2^2))^0.5)];
% 
% A{3}=[-R1*b1-(R12*b1*a2)/((abs(b1^2-a2^2))^0.5)    (R12*b1*a2)/((abs(b1^2-a2^2))^0.5);
%      (R12*b1*a2)/((abs(b1^2-a2^2))^0.5)          -R2*a2-(R12*b1*a2)/((abs(b1^2-a2^2))^0.5) ];
% 
% A{4}=[-R1*b1-(R12*b1*b2)/((abs(b1^2-b2^2))^0.5)    (R12*b1*b2)/((abs(b1^2-b2^2))^0.5);
%      (R12*b1*b2)/((abs(b1^2-b2^2))^0.5)          -R2*b2-(R12*b1*b2)/((abs(b1^2-b2^2))^0.5) ];
% 
% 
% B0=I;
% B{1}=B0;
% B{2}=B0;
% B{3}=B0;
% B{4}=B0;
% 
% E0=[0  0;
%    0  0];
% E{1}=E0;
% E{2}=E0;
% E{3}=E0;
% E{4}=E0;
% 
% J0=[0.6  0;0  0.5];
% J{1}=J0;
% J{2}=J0;
% J{3}=J0;
% J{4}=J0;
% 
% F0=[0;0];
% F{1}=F0;
% F{2}=F0;
% F{3}=F0;
% F{4}=F0;
% 
% 
% C0=[0.5 0.5];
% C{1}=C0;
% C{2}=C0;
% C{3}=C0;
% C{4}=C0;
% 
% D0=[0 0];
% D{1}=D0;
% D{2}=D0;
% D{3}=D0;
% D{4}=D0;
% 
% jie_da=1.5;
% jie_xiao=0.5;
% eta=[1;5];
% 
% r=4;
% n=6;
% u=0.9;
% Cst=[];
% % T=0.60
% % t_0=0.3;
% % t_1=0.3
% 
% 
% t_0=0.1;
% t_1=0.6

%%

A{1}=[-2     0.1;0.15      0.2];
A{2}=[-1.8   0.1;0.25      0.3];

B{1}=I;
B{2}=I;

J{1}=[1.1   0.1;0.1  0.8];
J{2}=[1.2   0.1;0.1  0.8];

E{1}=[0.5;0];
E{2}=E{1};

F{1}=[0.5;0];
F{2}=F{1};

C{1}=[0.2  0.1];
C{2}=C{1};

D{1}=0.1;
D{2}=D{1};

jie_da=1.69;
jie_xiao=0.65;

r=2;
n=3;
u=1.1;
eta=[1;8];
Cst=[];

t_0=1;
t_1=2;


%%
I=[1  0;0  1]

test_begin=3;
test_end=n+test_begin;


gama=0.26;
% gama=sdpvar(1,1,'full');

S=sdpvar(1,1,'full');
var_d=sdpvar(2,1,'full');
var_x=sdpvar(2,1,'full');


for i=test_begin:test_end
    v{i}=sdpvar(2,1,'full');
  
    Cst=[Cst;
        v{i}>=0;
        var_d>=v{i};
        var_x<=v{i};
        var_d<=jie_da*v{i};
        var_x>=jie_xiao*v{i}
        ];
end

for k=1:r
    lam_p{k}=sdpvar(2,1,'full');
    lam_n{k}=sdpvar(2,1,'full'); 
    Cst=[Cst;lam_p{k}>=0;lam_n{k}<=0];
end


v{test_begin-1}=0;
v{test_end+1}=0;

if u<=1
    T=t_1;
    fu=u;
else
    T=t_0;
    fu=exp((1-t_1/t_0)*log(u));
end


for  i=0:n
    for j=1:r
        for k=1:r
         
          L1{j}{test_begin+i}=((A{j}'+(log(u)/T)*I)*v{test_begin+i}+((-(n-2*i)*v{test_begin+i}-i*v{test_begin+i-1}+(n-i)*v{test_begin+i+1})/t_1))+C{j}'+lam_p{j}+lam_n{j};
    
          L0{j}{test_begin+i}=((A{j}'+(log(u)/T)*I)*v{test_begin+i}+((-(n-2*i)*v{test_begin+i}-i*v{test_begin+i-1}+(n-i)*v{test_begin+i+1})/t_0))+C{j}'+lam_p{j}+lam_n{j};
     
           P{k}{j}{test_begin+i}=eta'*B{k}'*v{test_begin+i}*A{j}+B{j}*eta*((1/jie_da)*lam_p{k}'+(1/jie_xiao)*lam_n{k}')+S*I;
        end
    end
end


for  i=0:n
    for j=1:r
         Cst=[Cst;         
              L1{j}{test_begin+i}<=0;
              L0{j}{test_begin+i}<=0;
              ];
    end
end


for  i=0:n
    for j=1:r
        for k=j:r
            
             PC{k}{j}{test_begin+i}=P{k}{j}{test_begin+i}+P{j}{k}{test_begin+i};
             
             Cst=[Cst;         
                 PC{k}{j}{test_begin+i}(1,2)>=0;
                 PC{k}{j}{test_begin+i}(2,1)>=0
                 ];
        end
    end
end

for  i=0:n
    for j=1:r
        
         H{j}{test_begin+i}=E{j}'*v{test_begin+i}+D{j}'-gama*fu;
         Cst=[Cst;H{j}{test_begin+i}<=0];
    end
end

for j=1:r
    
    M{j}=F{j}'*v{test_begin}-gama*fu;

    LE{j}=J{j}'*v{test_begin}-u*v{test_end};
    
    Cst=[Cst;M{j}<=0;LE{j}<=0];

end

ops=sdpsettings('solver','mosek');
optimize(Cst,[],ops);

