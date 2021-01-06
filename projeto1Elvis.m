%Projeto 1 Elvis

%Dados de entrada do projeto (delta1,delta2,tp)
delta1 = 0.144 %retirado da figura 
delta2 = 0.496 %retirado da figura 
tp = 0.0192    %retirado da figura 

%Cálculo do sobressinal(Mp)
Mp = delta1/delta2

%Calculo de Zeta a partir do Sobre-sinal
zeta = sqrt(((log(Mp))^2)/(pi^2+(log(Mp))^2))

%Cálculo do (Wn)
Wn = pi/(tp*sqrt(1-zeta^2))

%Cálculo do Numerador
num = Wn^2

%Cálculo do Denominador
den = [1 2*Wn*zeta Wn^2] 

%Cálculo da Função de Transferência da Planta 
Gs = tf(num,den)    

%Ts5 = pi / (Wn*sqrt(1-zeta^2))
Ts5 = 1/(zeta*Wn)

%Tempo de amostragem = 10 a 15x menor que o Ts5% (prático)
T = Ts5/15

step(Gs)