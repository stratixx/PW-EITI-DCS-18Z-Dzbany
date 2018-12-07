%cell vaues to vectors conversion
cvt_fan = zeros(size(cell2mat(fan))*[1; 0],1);
cvt_heater = zeros(size(cell2mat(heater))*[1; 0],1);
cvt_temp = zeros(size(cell2mat(temp))*[1; 0],1);
cvt_out = zeros(size(cell2mat(out))*[1; 0],1);

for n=1:size(cell2mat(fan))*[1; 0]
   
    cvt_fan(n) = str2double(fan(n));
    cvt_heater(n) = str2double(heater(n));
    cvt_temp(n) = str2double(temp(n));
    cvt_out(n) = str2double(out(n));
    
end

fan = cvt_fan;
heater=cvt_heater;
temp=cvt_temp;
out=cvt_out;

clear cvt_fan cvt_heater cvt_out cvt_temp n