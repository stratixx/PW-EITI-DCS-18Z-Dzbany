load('workspace.mat', 'data3');
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
temp = ones(201,1)*temperature(end);
temp = arrayfun(@(x) x+(0.00-0.002)*rand(1,1) - 0.002, temp);
for i=1:5:size(temp,1)
    temp(i:i+4) = temp(i);
end
temp = temp(1:201);
temperature(length(temperature):length(temperature)+200) = temp;
 fan(length(fan):length(fan)+200) = max(fan);
d = iddata(temperature,fan,1);

c = tfest(d,1);
[s,x]=step(c);

f = figure('visible','off');
hold on
plot(x+41,s)
plot(temperature./10)
plot(fan./1000)
legend("model output", "object output", "0.01 * input");
grid minor
xlabel("time [s]")
hold off
fig_pos = f.PaperPosition;
f.PaperSize = [fig_pos(3) fig_pos(4)];

print(f, 'wykresik_zaklocenia','-dpdf','-bestfit')