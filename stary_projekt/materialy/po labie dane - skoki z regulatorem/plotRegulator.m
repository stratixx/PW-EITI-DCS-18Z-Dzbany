function [  ] = plotRegulator( name, startk, heater, fan, temp, temp_zad   )

%wyznaczenie chwil skoku wartoœci sterowania i zak³ócenia
heaterStepK = find(abs(heater(2:end)-heater(1:end-1))'>25);
fanStepK = find(abs(fan(2:end)-fan(1:end-1))'>25);
temp_zadStepK = find(abs(temp_zad(2:end)-temp_zad(1:end-1))'>0.5);
disp(['fig ' name ': heater steps in:{' num2str(heaterStepK) '} fan steps in:{' num2str(fanStepK) '} temp_zad steps in:{' num2str(temp_zadStepK) '}']);

fan = fan(startk:end);
temp = temp(startk:end);
heater = heater(startk:end);
temp_zad = temp_zad(startk:end);

plotEnd=length(fan)-mod(length(fan),100);


f = figure('visible','off');

subplot(2,1,1)
hold on
grid on
stairs(temp(1:plotEnd),'b')
stairs(temp_zad(1:plotEnd),'r')
legend('TEMP', 'TEMP_z_a_d', 'Location', 'West');
axis([0 plotEnd min(temp) max(temp)]);
ylabel('Temperatura [*C]')
title('Temperatura obiektu')

subplot(2,1,2)
hold on
grid on
xlabel('czas(s)');
ylabel('Wysterowanie')
title('Sterowanie i zaklocenie obiektu')
stairs(fan(1:plotEnd),'m')
stairs(heater(1:plotEnd),'b')
legend('FAN','HEATER', 'Location', 'East');
axis([0 plotEnd min(min([fan, heater])) max(max([fan heater]))]);


drawnow()
hold off

fig_pos = f.PaperPosition;
f.PaperSize = [fig_pos(3) fig_pos(4)];
print(f, name,'-dpdf','-bestfit')
close(f)

end

