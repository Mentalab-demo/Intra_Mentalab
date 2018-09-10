%% plotting deviation for conneceted all channels


filename = 'DATA074.BIN';
data = read_bin_data(filename);
EEG_pack = data.EEG;
sig = zeros(4,0);% zeros(4,length(EEG_pack)*size(EEG_pack(1).data,2));

for i=1:length(EEG_pack)
    sig = cat(2,sig,EEG_pack(i).data);
end

time = 0.1*linspace(0,time(end)-time(1),size(sig,2)); % in ms

sig_gen = ones(4,193875);  % one value would mean no deviation. It is deviation as scaling factor
sig_gen(:,1:7995) = 5;
sig_gen(:,12230:61430) = 10;
sig_gen(:,63410:126700) = 50;
sig_gen(:,129400:140700) = 100;
sig_gen(:,145000:150900) = 10;
sig_gen(:,153100:155700) = 10;
sig_gen(:,157200:161500) = 10;
sig_gen(:,165100:168400) = 10;
sig_gen(:,170200:175100) = 10;
sig_gen(:,176900:181300) = 10;
sig_gen(:,183900:185900) = 10;
sig_gen(:,187700:193875) = 10;

sig_p2p = zeros(4,193875);
sig_p2p(:,1:7995) = 0.5*repmat(max(sig(:,1:7995),[],2) - min(sig(:,1:7995),[],2),1,7995);
sig_p2p(:,12230:61430) = 0.5*repmat(max(sig(:,12230:61430),[],2) - min(sig(:,12230:61430),[],2) ,1,-12230+61430+1);
sig_p2p(:,63410:126700) = 0.5*repmat(max(sig(:,63410:126700),[],2) - min(sig(:,63410:126700),[],2) ,1,-63410+126700+1);
sig_p2p(:,129400:140700) = 0.5*repmat(max(sig(:,129400:140700),[],2) - min(sig(:,129400:140700),[],2) ,1,-129400+140700+1);
sig_p2p(:,145000:150900) = 0.5*repmat(max(sig(:,145000:150900),[],2) - min(sig(:,145000:150900),[],2) ,1,-145000+150900+1);
sig_p2p(:,153100:155700) = 0.5*repmat(max(sig(:,153100:155700),[],2) - min(sig(:,153100:155700),[],2) ,1,-153100+155700+1);
sig_p2p(:,157200:161500) = 0.5*repmat(max(sig(:,157200:161500),[],2) - min(sig(:,157200:161500),[],2) ,1,-157200+161500+1);
sig_p2p(:,165100:168400) = 0.5*repmat(max(sig(:,165100:168400),[],2) - min(sig(:,165100:168400),[],2) ,1,-165100+168400+1);
sig_p2p(:,170200:175100) = 0.5*repmat(max(sig(:,170200:175100),[],2) - min(sig(:,170200:175100),[],2) ,1,-170200+175100+1);
sig_p2p(:,176900:181300) = 0.5*repmat(max(sig(:,176900:181300),[],2) - min(sig(:,176900:181300),[],2) ,1,-176900+181300+1);
sig_p2p(:,183900:185900) = 0.5*repmat(max(sig(:,183900:185900),[],2) - min(sig(:,183900:185900),[],2) ,1,-183900+185900+1);
sig_p2p(:,187700:193875) = 0.5*repmat(max(sig(:,187700:193875),[],2) - min(sig(:,187700:193875),[],2) ,1,-187700+193875+1);


dev_final = sig_p2p./sig_gen;

figure;
plot(time,dev_final(1,:))
hold on
plot(time,dev_final(2,:))
plot(time,dev_final(3,:))
plot(time,dev_final(4,:))
legend('1','2','3','4')
ylabel('device signal/sig gen input');
xlabel('time(ms)')
title('Signal Gen Input: 5mV-10Hz, 10mV-10Hz, 50mV-10Hz, 100mV-10Hz, 10mV-1Hz, 10mV-2Hz, 10mV-5Hz, 10mV-11Hz, 10mV-15Hz, 10mV-32Hz, 10mV-43Hz, 10mV-69Hz');


