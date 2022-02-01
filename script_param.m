% close all;clc
choice = menu('choisir option','Classic command','Fuzzy command','Fuzzy command with observer')
switch choice
case(1)%******************* Classic command********************
% ***************** machine parameters *****************  
tf=4;
Ls=0.1568;
Lr=0.1568;
Rs=1.2;
Rr=1.8;
fr=0.001;
J=0.2;
M=0.15;
P=2;
Cr=0;
FS=50;
US=230;
FR=5;
UR=5;
segma=1-((M^2)/(Ls*Lr));
tcr=3;     
%***************** Regulator parameters % % % % %
Trep=15e-3;   % Reponse time
PSI=0.7;  %
WN=3/(Trep*PSI)
Tr=Lr/Rr;
Ts=Ls/Rs;
% VITESSE
KPV=(2*J*PSI*WN)-fr
KIV=J*(WN^2)
% IDR
Kr=1/(Rr*Tr*segma)
Dr=1/(Tr*segma)
KPIDR=(2*PSI*WN-Dr)/Kr
KIIDR=(WN^2)/Kr
% IQR
KPIQR=(2*PSI*WN-Dr)/Kr
 KIIQR=(WN^2)/Kr
open('COMMANDIFOC')
sim('COMMANDIFOC')
% % % % % % % Results % % % % % % %
%*****************Speed curve ***************** 
figure(1)
set(gca,'fontsize',16)
plot(t.signals.values,V_ref.signals.values,'g')
hold on
plot(t.signals.values,vitesse.signals.values,'b')
title('Speed')
xlabel('Time(s)')
ylabel('Speed(rad/s)')
legend('speed-ref','Speed-IP')
grid
%*****************Torque_em curve ***************** 
figure(2)
set(gca,'fontsize',16)
plot(t.signals.values,Cem.signals.values)
hold on
title('Tem')
xlabel('Time(s)')
ylabel('Tem(N/m)')
grid
%*****************Rotor current curve***************** 
figure(3)
set(gca,'fontsize',16)
plot(t.signals.values,IQR.signals.values)
hold on
title('Direct rotor current')
xlabel('Time(s)')
ylabel('Idr(A)')
grid
figure(4)
set(gca,'fontsize',16)
plot(t.signals.values,IDR.signals.values)
hold on
title('Quadrature rotor current')
xlabel('Time(s)')
ylabel('Iqr(A)')
grid
%%*****************Rotor flux curve***************** 
figure(5)
set(gca,'fontsize',16)
plot(t.signals.values,fluxDR.signals.values)
hold on
title('Direct rotor flux')
xlabel('Time(s)')
ylabel('fluxDR(WB)')
grid
figure(6)
set(gca,'fontsize',16)
plot(t.signals.values,fluxQR.signals.values)
hold on
title(' Quadrature rotor flux')
xlabel('Time')
ylabel('fluxQR(WB)')
grid
%*****************stator current curve***************** 
figure(7)
set(gca,'fontsize',16)
plot(t.signals.values,IDS.signals.values)
hold on
title('Direct stator current')
xlabel('Time(s)')
ylabel('Ids(A)')
grid
figure(8)
set(gca,'fontsize',16)
plot(t.signals.values,IQS.signals.values)
hold on
title('Quadrature stator current')
xlabel('Time')
ylabel('Iqs(A)')
grid
%*****************stator flux curve***************** 
figure(9)
set(gca,'fontsize',16)
plot(t.signals.values,fluxDS.signals.values')
hold on
title('Direct stator flux')
xlabel('Time(s)')
ylabel('fluxDS(WB)')
grid
figure(10)
set(gca,'fontsize',16)
plot(t.signals.values,fluxQS.signals.values)
hold on
title('Quadrature stator flux')
xlabel('Time')
ylabel('fluxQS(WB)')
grid
case(2)%******************* Commande Floue ********************
%% % % % % % % parametres de la machine % % % % % % %     
tf=4;
Ls=0.1568;
Lr=0.1568;
Rs=1.2;
Rr=1.8;
fr=0.001;
J=0.2;
M=0.15;
P=2;
Cr=0;
FS=50;
US=230;
FR=5;
UR=5;
segma=1-((M^2)/(Ls*Lr));
tcr=3;     
%% % % % % % % parametres de régulateur % % % % % % %
% Trep=15e-3;   %TEMP DE REPONCE
% PSI=0.7;  %
% WN=3/(Trep*PSI)
% Tr=Lr/Rr;
% Ts=Ls/Rs;
% % VITESSE
% KPV=(2*J*PSI*WN)-fr
% KIV=J*(WN^2)
% % IDR
% Kr=1/(Rr*Tr*segma)
% Dr=1/(Tr*segma)
% KPIDR=(2*PSI*WN*Lr)-Rr
% KIIDR=(WN^2*segma*Lr)
% % IQR
% KPIQR=(2*PSI*WN*Lr)-Rr
%  KIIQR=(WN^2*segma*Lr)
open('IFOC_FLOUE')
sim('IFOC_FLOUE')
% % % % % % % Results % % % % % % %
%*****************Speed curve ***************** 
figure(1)
set(gca,'fontsize',16)
plot(t.signals.values,V_ref.signals.values,'g')
hold on
plot(t.signals.values,vitesse.signals.values,'b')
title('Speed')
xlabel('Time(s)')
ylabel('Speed(rad/s)')
legend('speed-ref','Speed-fuzzy')
grid
%*****************Torque_em curve ***************** 
figure(2)
set(gca,'fontsize',16)
plot(t.signals.values,Cem.signals.values)
hold on
title('Tem')
xlabel('Time(s)')
ylabel('Tem(N/m)')
grid
%*****************Rotor current curve***************** 
figure(3)
set(gca,'fontsize',16)
plot(t.signals.values,IQR.signals.values)
hold on
title('Direct rotor current')
xlabel('Time(s)')
ylabel('Idr(A)')
grid
figure(4)
set(gca,'fontsize',16)
plot(t.signals.values,IDR.signals.values)
hold on
title('Quadrature rotor current')
xlabel('Time(s)')
ylabel('Iqr(A)')
grid
%%*****************Rotor flux curve***************** 
figure(5)
set(gca,'fontsize',16)
plot(t.signals.values,fluxDR.signals.values)
hold on
title('Direct rotor flux')
xlabel('Time(s)')
ylabel('fluxDR(WB)')
grid
figure(6)
set(gca,'fontsize',16)
plot(t.signals.values,fluxQR.signals.values)
hold on
title(' Quadrature rotor flux')
xlabel('Time')
ylabel('fluxQR(WB)')
grid
%*****************stator current curve***************** 
figure(7)
set(gca,'fontsize',16)
plot(t.signals.values,IDS.signals.values)
hold on
title('Direct stator current')
xlabel('Time(s)')
ylabel('Ids(A)')
grid
figure(8)
set(gca,'fontsize',16)
plot(t.signals.values,IQS.signals.values)
hold on
title('Quadrature stator current')
xlabel('Time')
ylabel('Iqs(A)')
grid
%*****************stator flux curve***************** 
figure(9)
set(gca,'fontsize',16)
plot(t.signals.values,fluxDS.signals.values')
hold on
title('Direct stator flux')
xlabel('Time(s)')
ylabel('fluxDS(WB)')
grid
figure(10)
set(gca,'fontsize',16)
plot(t.signals.values,fluxQS.signals.values)
hold on
title('Quadrature stator flux')
xlabel('Time')
ylabel('fluxQS(WB)')
grid
case(3)%******************* 'Fuzzy command with observer' ********************
    % ***************** machine parameters *****************   
tf=4;
Ls=0.1568;
Lr=0.1568;
Rs=1.2;
Rr=1.8;
fr=0.001;
J=0.2;
M=0.15;
P=2;
Cr=0;
FS=50;
US=230;
FR=5;
UR=5;
segma=1-((M^2)/(Ls*Lr));
tcr=3;     
% Regulator parameters 
Trep=15e-3;   %REPONsE Time
PSI=0.7;  %
WN=3/(Trep*PSI)
Tr=Lr/Rr;
Ts=Ls/Rs;
% Obsever parameters
A=[-fr/J -1/J;0 0]
B=[(-P*0.85)/J;0]
C=[1 0]
pol=eig(A)
pol1=[-50 -50]
L=(acker(A',C',pol1))'
A1=A-(L*C)
mm=L
% VITESSE
KPV=(2*J*PSI*WN)-fr
KIV=J*(WN^2)
% IDR
Kr=1/(Rr*Tr*segma)
Dr=1/(Tr*segma)
KPIDR=(2*PSI*WN-Dr)/Kr
KIIDR=(WN^2)/Kr
% IQR
KPIQR=(2*PSI*WN-Dr)/Kr
 KIIQR=(WN^2)/Kr
open('ifoc_floueOBS')
sim('ifoc_floueOBS')
% % % % % % % Results % % % % % % %
%*****************Speed curve *****************  
figure(1)
set(gca,'fontsize',16)
plot(t1.signals.values,V_ref.signals.values,'g')
hold on
% plot(t.signals.values,vitesse.signals.values,'b')
% hold on
plot(t1.signals.values,vitesse1.signals.values,'r')
hold on
plot(t1.signals.values,Vobs.signals.values,'K')
title('Speed')
xlabel('Time(s)')
ylabel('vitesse(rad/s)')
legend('Speed-ref','Speed-Fuzzy','Speed-ObsV')
grid
end 
