clc;
clear;
close all;

% Given data
PR = 30e6; % Receiving end power in watts
VR_LL = 132000; % Receiving end line-to-line voltage in V
PF = 0.85; % Power factor (lagging)
Z = 20 + 1j*52; % Series impedance per phase
Y = 315e-6; % Shunt admittance per phase

% Convert line-to-line voltage to phase voltage
VR_phase = VR_LL / sqrt(3);

% Calculate reactive power
theta = acos(PF); % Power factor angle
QR = PR * tan(theta); % Reactive power

% Apparent power
SR = PR + 1j*QR;

% Receiving end current
IR = conj(SR) / (sqrt(3) * VR_LL);

% ABCD Constants for Nominal T model
A = 1 + (Z * Y) / 2;
B = Z;
C = Y * (1 + (Z * Y) / 4);
D = A; % For a symmetrical transmission line

% Sending end voltage
VS_phase = A * VR_phase + B * IR;
VS_LL = abs(VS_phase) * sqrt(3); % Line-to-line sending voltage

% Voltage Regulation
voltage_regulation = ((VS_LL - VR_LL) / VR_LL) * 100;

% Display results
fprintf('\nResults:\n');
fprintf('A = %.4f + j%.4f\n', real(A), imag(A));
fprintf('B = %.4f + j%.4f\n', real(B), imag(B));
fprintf('C = %.6f + j%.6f\n', real(C), imag(C));
fprintf('D = %.4f + j%.4f\n', real(D), imag(D));
fprintf('Sending End Voltage (Line-to-Line): %.2f kV\n', VS_LL/1000);
fprintf('Voltage Regulation: %.2f %%\n', voltage_regulation);