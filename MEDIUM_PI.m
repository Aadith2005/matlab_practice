PR = input("Enter the power (in W): ");  
PF = input("Enter the power factor: ");  
VR1 = input("Enter the receiving end voltage (in V): ");  

VR_mag = VR1 / sqrt(3);
VR_angle = 0; % Assume reference angle is 0 degrees
VR = VR_mag * exp(1i * deg2rad(VR_angle))% Convert to complex form

IR_mag = PR / (3 * VR_mag * PF);
phi = acosd(PF); % Power factor angle
IR = IR_mag * exp(-1i * deg2rad(phi)) % Convert to complex form

R = input("Enter the resistance (Ω): ");  
X = input("Enter the reactance (Ω): ");  
Z = complex(R, X) % Impedance

y = input("Enter the shunt susceptance (S): ");
Y = complex(0, y); % Admittance

A = 1 + ((Z * Y) / 2);
B = Z;
C = Y * (1 + ((Z * Y) / 4));
D = A; 

VS = A * VR + B * IR

VSB = abs(VS) * sqrt(3)

IS = C * VR + D * IR
theta = rad2deg(angle(VS))  % Sending-end voltage angle in degrees
sky = rad2deg(angle(IS))   % Sending-end current angle in degrees
SA = abs(theta - sky)       % Sending-end power factor angle
SPF = cosd(SA);               % Sending-end power factor

% Voltage regulation
regulation = (((abs(VS)/(0.99)) - abs(VR)) / abs(VR)) * 100;

% Efficiency calculation
efficiency = (PR / (3 * abs(VS) * abs(IS) * SPF)) * 100;

disp(['Voltage Regulation: ', num2str(regulation), ' %']);
disp(['Efficiency: ', num2str(efficiency), ' %']);

