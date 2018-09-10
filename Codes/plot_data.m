
% Reading the binary file and ploting the signal
clc; clear all;

filename = 'DATA081.BIN';
data = read_bin_data(filename);
EEG_pack = data.EEG;
sig = zeros(4,0);% zeros(4,length(EEG_pack)*size(EEG_pack(1).data,2));
time = zeros(1,0);

for i=1:length(EEG_pack)
    sig = cat(2,sig,EEG_pack(i).data);
    time = cat(2,time,EEG_pack(i).timestamp);
end

time = 0.1*linspace(0,time(end)-time(1),size(sig,2)); % in ms



%% plot all connected channels
figure;
plot(time,sig(1,:))
hold on
plot(time,sig(2,:))
plot(time,sig(3,:))
plot(time,sig(4,:))
legend('1','2','3','4')
hold off
xlabel('time (ms)');
ylabel('Voltage (mV)')
%title('Signal Gen Input: 5mV-10Hz, 10mV-10Hz, 50mV-10Hz, 100mV-10Hz, 10mV-1Hz, 10mV-2Hz, 10mV-5Hz, 10mV-11Hz, 10mV-15Hz, 10mV-32Hz, 10mV-43Hz, 10mV-69Hz')
title('Signal Gen Input: 10mV-1Hz')


%% ploot frequency sweep
figure;


plot(time(5844:end),sig(1,5844:end))
hold on
plot(time(5844:end),sig(2,5844:end))
plot(time(5844:end),sig(3,5844:end))
plot(time(5844:end),sig(4,5844:end))
legend('1','2','3','4')
hold off
xlabel('time (ms)');
ylabel('Voltage (mV)')
title('Signal Gen Input: 10mV,1-50Hz')
