names = {'skok_300_400_fan_300_heater_2.mat'   'skok_400_300_heater_300_fan.mat '      ...                     
'skok_300_400_heater_300_fan_2a.mat'   };

% start rysowania w próbce numer
%startVect = [ 321 233 207 152 127 226 295 278 257 ]-100+2;
startVect=[1 1 1];
close all

for fig=length(names):-1:1
name = names{fig};
startk = startVect(fig);
load(name)

%obracam wektory
fan = flipud(fan);
heater = flipud(heater);
temp = flipud(temp);
% name - nazwa pliku wyjœciowego
% startk - ile pierwszych próbek pomin¹æ
% dalej dane heater, fan, temp
plotDCS(name, startk, heater, fan, temp)

end