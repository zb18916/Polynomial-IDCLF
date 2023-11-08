clc;
clear;

I=[1  0;0  1];

%%

A=[0.1  1;1   -1];
E=[0.1  0.1;0.2   0.2];
% % 
% % 
% % A=[-3    1;1  -4];
% % E=[1.7 0.3;0.2   1.8];
% % 
% A=[-1   0.1;0  1.2];
% C0=[0.2  0;0  -0.5];
% E=C0+I;
% % % 
n=5;
u=0.5;
C=[];
T=1.943;
t_0=T;
t_1=T;



%%

test_begin=2;
test_end=n+test_begin;

C=[];
for i=test_begin-1:test_end+1
    v{i}=sdpvar(2,1,'full');
    C=[C;v{i}>=1e-20];
end

if u<=1
    T=t_1;
else
    T=t_0;
end

for  i=0:n
    L_0{test_begin+i}=(A'+(log(u)/T)*I)*v{test_begin+i}+((-(n-2*i)*v{test_begin+i}-i*v{test_begin+i-1}+(n-i)*v{test_begin+i+1})/t_0);
    L_1{test_begin+i}=(A'+(log(u)/T)*I)*v{test_begin+i}+((-(n-2*i)*v{test_begin+i}-i*v{test_begin+i-1}+(n-i)*v{test_begin+i+1})/t_1);
end


for  i=test_begin:test_end
    C=[C;L_0{i}<=-1e-20;L_1{i}<=-1e-20];
end

LE=E'*v{test_begin}-u*v{test_end};

C=[C;LE<=0];

ops=sdpsettings('solver','mosek');
optimize(C,[],ops)
min(check(C))


