%Projeto 1 Elvis

%Dados de entrada do projeto (delta1,delta2,tp)
delta1 = 0.144 %retirado da figura 
delta2 = 0.496 %retirado da figura 
tp = 0.0192    %retirado da figura 

%C�lculo do sobressinal(Mp)
Mp = delta1/delta2

%Calculo de Zeta a partir do Sobre-sinal
zeta = sqrt(((log(Mp))^2)/(pi^2+(log(Mp))^2))

%C�lculo do (Wn)
Wn = pi/(tp*sqrt(1-zeta^2))

%C�lculo do Numerador
num = Wn^2

%C�lculo do Denominador
den = [1 2*Wn*zeta Wn^2] 

%C�lculo da Fun��o de Transfer�ncia da Planta 
Gs = tf(num,den)    

%Ts5 = pi / (Wn*sqrt(1-zeta^2))
Ts5 = 1/(zeta*Wn)

%Tempo de amostragem = 10 a 15x menor que o Ts5% (pr�tico)
T = Ts5/15

step(Gs)