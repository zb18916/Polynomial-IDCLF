clc;
clear;

%%
A{1}=[-2     0.1;0.15      0.2];
A{2}=[-1.8   0.1;0.25      0.3];


E{1}=[1.1   0.1;0.1  0.8];
E{2}=[1.2   0.1;0.1  0.8];

B{1}=[0.5;0];
B{2}=B{1};

F{1}=[0.5;0];
F{2}=F{1};

C{1}=[0.2  0.1];
C{2}=C{1};

D{1}=0.1;
D{2}=D{1};

r=2;
n=274;
u=1.45;
Cst=[];
% T=0.60
t_0=0.21;
t_1=0.21;

% gama=0.4838;

%%


I=[1  0;0  1]


%设置变量，由于统一式子中左右两边会超出，
%随意拉出一个n空间来给变量赋值。
%后面若要调用变量，需要以test_begin+第几个变量（从0开始）。
test_begin=3;
test_end=n+test_begin;


gama=sdpvar(1,1,'full');
for i=test_begin:test_end
    v{i}=sdpvar(2,1,'full');
    
    Cst=[Cst;v{i}>=0];
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
         
        L1{j}{test_begin+i}=((A{j}'+(log(u)/T)*I)*v{test_begin+i}+((-(n-2*i)*v{test_begin+i}-i*v{test_begin+i-1}+(n-i)*v{test_begin+i+1})/t_1))+C{j}';
    
        L0{j}{test_begin+i}=((A{j}'+(log(u)/T)*I)*v{test_begin+i}+((-(n-2*i)*v{test_begin+i}-i*v{test_begin+i-1}+(n-i)*v{test_begin+i+1})/t_0))+C{j}';

        Cst=[Cst;L1{j}{test_begin+i}<=0;L0{j}{test_begin+i}<=0];
    end
end


for  i=0:n
    for j=1:r
        
         H{j}{test_begin+i}=B{j}'*v{test_begin+i}+D{j}'-gama*fu;
         Cst=[Cst;H{j}{test_begin+i}<=0];
    end
end


M1=F{1}'*v{test_begin}-gama*fu;
M2=F{2}'*v{test_begin}-gama*fu;

LE1=E{1}'*v{test_begin}-u*v{test_end};
LE2=E{2}'*v{test_begin}-u*v{test_end};

Cst=[Cst;M1<=0;M2<=0;LE1<=0,LE2<=0];

ops=sdpsettings('solver','mosek');

% ops=sdpsettings('solver','gurobi');

% ops=sdpsettings('solver','linprog'); 
% solvesdp(C,[],ops)
optimize(Cst,gama,ops);
check(Cst)

z=min(check(Cst))
value(gama)

