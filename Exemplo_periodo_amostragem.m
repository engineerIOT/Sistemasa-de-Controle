% Exemplo de análise do período de amostragem para sistemas subamortecidos
clear
clc
T=.5;
K=2;
Gp=tf(1,[1 1]);
Gpz=c2d(Gp,T)
% controlador integral
Gdz=tf(K*[1 0],[1 -1],T);

FTMF=feedback(Gdz*Gpz,1);
polos=pole(FTMF);
z=polos(1);
modulo=abs(z)
angulo=angle(z)
TzetaWn=-log(modulo)
fator=TzetaWn/angulo
syms x
zeta=solve(x/sqrt(1-x^2) == fator);
zeta=eval(zeta)
wn=TzetaWn/T/zeta;
Mp=exp(-pi*zeta/sqrt(1-zeta^2))
Ts5=3/(zeta*wn)
step(FTMF)
% relação Wa/Wd
wa_wd=2*pi/angulo

% comparar valores do gráfico, com valores calculados
% se a escolha do periodo de amostragem for boa, os valores serão próximos
