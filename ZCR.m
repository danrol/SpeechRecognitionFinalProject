function  ZCRr1 = ZCR( frames, f_d, fs, data)
% This file calculates short time Zero Crossing Rate (ZCR) of
% voice/unvoiced
% signal. or in other words finds Frame ZCR

%% finding ZCR of all frames
[r, c] = size(frames);

ZCRf1 = zeros(1, r);

for i = 1 : r  
    x = frames(i, :);

    %% Method 1
    for k = 1:length(x) - 1
    
        if ((x(k) < 0) && (x(k + 1) > 0 ))
            ZCRf1(i) = ZCRf1(i) + 1;
   
        elseif ((x(k) > 0) && (x(k + 1) < 0))
            ZCRf1(i) = ZCRf1(i) + 1;
        end
    end   
    
end

% calculating rate
ZCRr1 = ZCRf1/length(x);
ZCRr1 = ZCRr1/max(ZCRr1);
f_size = round(f_d * fs);
zcr_wave = 0;
for j = 1 : length(ZCRr1)
    l = length(zcr_wave);
    zcr_wave(l : l + f_size) = ZCRr1(j);
end
% plot the ZCR with Signal
%t = [0 : 1/fs : length(data)/fs]; % time in sec
%t = t(1:end - 1);
%t1 = [0 : 1/fs : length(zcr_wave)/fs];
%t1 = t1(1:end - 1);

%plot(t,data'); hold on;
%plot(t1,zcr_wave,'r','LineWidth',2);

% Silence Removal
%id = find(ZCRr1 <= 0.2);
%fr_ws = frames(id,:); % frames without silence

% reconstruct signal
%data_r = reshape(fr_ws',1,[]);
%sound(data_r, fs);
%figure;
%plot(data);hold on;
%plot(data_r,'g'); title('speech without silence');