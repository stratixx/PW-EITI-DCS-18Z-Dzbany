temperature = flipud(data3(:,3));
heater = flipud(data3(:,4));
fan = flipud(data3(:,5));
i = 1;
while fan(i) == fan(1)
    i=i+1;
end
i=i-40;
temperature = temperature(i:length(temperature));
heater = heater(i:length(heater));
fan = fan(i:length(fan));

temperature = (temperature-max(temperature))./10;
fan = (fan-min(fan))./10;
% temperature(length(temperature):length(temperature)+200) = min(temperature);
%  fan(length(fan):length(fan)+200) = min(fan);
d = iddata(temperature,fan,1);

c = tfest(d,1)
figure
hold on
step(c)
plot(temperature./10)
plot(fan./100)
hold off