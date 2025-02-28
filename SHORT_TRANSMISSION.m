clc;
clear;
close all;
R = input('Enter the resistance per phase (Ohms): ');
X = input('Enter the reactance per phase (Ohms): ');
VR_LL = input('Enter the receiving end line-to-line voltage (V): ');
PR = input('Enter the receiving end power (W): ');
VR_phase = VR_LL / sqrt(3);
PF = input('Enter the PF : ');
IR = (PR*(10^6)) / (3 * VR_phase*(10^3)*PF);
Z = R + 1j*X;  
VS_phase = (VR_phase*(10^3)) + Z * IR;
VS_LL = abs(VS_phase) * sqrt(3); 
C= acos(PF);
d= sin(C);
PS = (3*abs(VS_phase)*IR*PF) ;
PL =(72.414-PR);
efficiency = (PR/PS*(10^6)) * 100;
voltage_regulation = ((abs(VS_phase) - (VR_phase*10^3)) / (VR_phase*10^3)) * 100;
fprintf('\nResults:\n');
fprintf('Sending End Voltage (Line-to-Line): %.2f kV\n', VS_LL/1000);
fprintf('Sending End Current: %.2f A\n', IR);
fprintf('Real Power in Line: %.2f W\n', PS);
fprintf('Reactive Power in Line: %.2f kW\n', C);
fprintf('Line Loss in Line: %.2f MW\n',PL );
fprintf('Transmission Efficiency: %.2f %%\n', efficiency);
fprintf('Voltage Regulation: %.2f %%\n', voltage_regulation);




