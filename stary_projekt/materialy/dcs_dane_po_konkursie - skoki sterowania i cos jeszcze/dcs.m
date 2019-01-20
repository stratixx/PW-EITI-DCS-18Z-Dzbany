load('workspace.mat', 'data1');
temperature = flipud(data1(:,3));
heater = flipud(data1(:,4));
fan = flipud(data1(:,5));
i = 1;
while heater(i) == heater(1)
    i=i+1;
end
i=i-40;
temperature = (temperature-min(temperature))./10;
heater = (heater-min(heater))./100;
temperature(length(temperature):length(temperature)+200) = max(temperature);
heater(length(heater):length(heater)+200) = max(heater);
d = iddata(temperature,heater,1);

a = tfest(d,1);

figure
hold on
step(a);
plot(temperature)
plot(heater./1)
hold off