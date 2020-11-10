function str = decompose(Unitaries)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
str = [];
init = ['init = QuantumCircuit(3)\n'];   %This can be modified later, in the Jupyter Notebook
str = [str,sprintf(init)];

%Construct measurement circuit
meas = ['\n\nmeas = QuantumCircuit(3,3)\n' ...
        'meas.measure(0,0)\n' ...
        'meas.measure(1,1)\n' ...
        'meas.measure(2,2)\n\n']
str = strcat(str,sprintf(meas));   %Print meas circuit to file

%Gates necessary for initialization
suGen;

%Compose all the circuits into the circuit.txt file
for k = 1:size(Unitaries,3)
    str = composeCircuit(Unitaries(:,:,k),['circuit_' num2str(k)],str);
end

%Store all the circuits in an array called 'circuits'
circuits_str = '\n\ncircuits = [';
for k=1:size(Unitaries,3)-1
    circuits_str = [circuits_str,'init+circuit_',num2str(k),'+meas,'];
end
circuits_str = [circuits_str,'init+circuit_',num2str(size(Unitaries,3)),'+meas];'];
str = strcat(str,sprintf(circuits_str));
end

