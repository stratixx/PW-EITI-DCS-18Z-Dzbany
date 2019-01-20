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
temp = ones(201,1)*temperature(end);
temp = arrayfun(@(x) x+(0.01-0.00)*rand(1,1) + 0.00, temp);
for i=1:5:size(temp,1)
    temp(i:i+4) = temp(i);
end
temp = temp(1:201);
temperature(length(temperature):length(temperature)+200) = temp;
heater(length(heater):length(heater)+200) = max(heater);
d = iddata(temperature,heater,1);
a = tfest(d,1);
[s,x]=step(a);
f = figure('visible','off');
hold on
x=x+208;
endyboy = find(x>800);
x = x(1:endyboy(1)-1);
s = s(1:endyboy(1)-1);
plot(x,s)
plot(temperature)
plot(heater)
legend("model output(temperature)", "normalised object output(temperature)", "normalised input(heater)");
grid minor
xlabel("time [s]")
hold off

fig_pos = f.PaperPosition;
f.PaperSize = [fig_pos(3) fig_pos(4)];

print(f, 'wykresik_model_obiekt','-dpdf','-bestfit')