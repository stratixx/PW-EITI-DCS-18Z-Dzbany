temperature = flipud(data2(:,3));
heater = flipud(data2(:,4));
fan = flipud(data2(:,5));
i = 1;
while heater(i) == heater(1)
    i=i+1;
end
i=i-40;
%temperature = temperature(i:length(temperature));
%heater = heater(i:length(heater));
%fan = fan(i:length(fan));

temperature = (temperature-max(temperature))./10;
heater = (heater-max(heater))./10;
temperature(length(temperature):length(temperature)+200) = min(temperature);
heater(length(heater):length(heater)+200) = min(heater);
d = iddata(temperature,heater,1);

b = tfest(d,2)
figure
hold on
step(b)
plot(temperature./10)
plot(heater./100)
hold off