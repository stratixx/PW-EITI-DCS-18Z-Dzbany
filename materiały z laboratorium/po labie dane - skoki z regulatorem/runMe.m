names = {'skok 30 na 35 wiatraczek zaklocenia.mat'                 'skok 40 na 30 wiatraczek zaklocenia.mat'...                 
'skok 35 na 40 wiatraczek zaklocenia.mat'                 'skok z 35 na 38 fajnie regulator se pomyka dzbvgan.mat'...  
'skok 38 na 37 heater 30 fan.mat'     };

% start rysowania w próbce numer
%startVect = [ 321 233 207 152 127 226 295 278 257 ]-100+2;
startVect=[1 1 1 1 1];
close all

for fig=length(names):-1:1
name = names{fig};
startk = startVect(fig);
load(name)
%obracam wektory
fan = flipud(fan);
heater = flipud(heater);
temp = flipud(temp);
out = flipud(out);
% name - nazwa pliku wyjœciowego
% startk - ile pierwszych próbek pomin¹æ
% dalej dane heater, fan, temp, (out jak temperatura zadana)
plotRegulator(name, startk, heater*10, fan, temp, out)

end