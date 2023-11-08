clc;
clear;

I=[1  0;0  1];

%%

% A=[0.1  1;1   -1];
% E=[0.1  0.1;0.2   0.2];
% % 
% % 
% % A=[-3    1;1  -4];
% % E=[1.7 0.3;0.2   1.8];
% % 
% A=[-1   0.1;0  1.2];
% C0=[0.2  0;0  -0.5];
% E=C0+I;
% % % 
% n=5;
% u=1.00001;
% C=[];
% T=0.5776
% t_0=T;
% t_1=T;



%%
% 
A=[-1  0.1;0   1.2];
E=[1.2   0;0   0.5];


u=1.001
n=5;
t_0=0.1824;
t_1=0.5757;
u_num=[];

%%



%设置变量，由于统一式子中左右两边会超出，
%随意拉出一个n空间来给变量赋值。
%后面若要调用变量，需要以test_begin+第几个变量（从0开始）。
test_begin=2;
test_end=n+test_begin;

C=[];
for i=test_begin-1:test_end+1
    v{i}=sdpvar(2,1,'full');
    C=[C;v{i}>=1e-20];
end

% v{test_begin-1}=[0;0];
% v{test_end+1}=[0;0];


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

% ops=sdpsettings('solver','gurobi');
% ops = sdpsettings('solver','lpsolve');
% ops=sdpsettings('solver','linprog'); 
% solvesdp(C,[],ops)
optimize(C,[],ops)
% optimize(C,L_0{test_end}(1)+L_0{test_end}(2),ops);
check(C)

min(check(C))
% value(v{test_begin})
% value(v{test_begin}-v{test_end})
% value(L_0{test_end})

for i=test_begin:test_end
    vv{i}=value(v{i});
end

save   v_date  vv n T
