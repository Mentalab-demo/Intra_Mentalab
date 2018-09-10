%% frequency response plot

filename = 'DATA081.BIN';
data = read_bin_data(filename);
EEG_pack = data.EEG;
sig = zeros(4,0);% zeros(4,length(EEG_pack)*size(EEG_pack(1).data,2));

for i=1:length(EEG_pack)
    sig = cat(2,sig,EEG_pack(i).data);
end



%starts at 5840
gain = zeros(4,-5840+36267+1);

n = 500;
for i = 5840:500:36267
    if i+500 > 36267
        n = 36267-i;
    end
    gain(:,i-5839:i-5839+(n-1)) = repmat(max(sig(:,i:i+n),[],2) - min(sig(:,i:i+n),[],2),1,n); 
end

gain = gain/10;  % it was 10mV signal
figure;
f = linspace(1,50,-5840+36267+1);

plot(f,gain(1,:));
hold on
plot(f,gain(2,:))
plot(f,gain(3,:))
plot(f,gain(4,:))
legend('1','2','3','4')
hold off
title('Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Signal(mV)/Input(mV)');



