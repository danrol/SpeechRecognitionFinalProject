

close all; clear all;

% read sound 
[data, fs] = audioread('shee.wav');
% normalize data
data = data / abs(max(data));
% do framing
f_d = 0.025;
f_size = round(f_d * fs);
n = length(data);
n_f = floor(n/f_size);  %no. of frames
temp = 0;
for i = 1 : n_f
    
   frames(i,:) = data(temp + 1 : temp + f_size);
   temp = temp + f_size;
end

% voiced sample (110 frame)
plot(frames(50,:));
figure; 
autocorr(frames(50,:),length(frames(50,:)) - 1);
figure; plot(abs(fft(frames(50,:))));

% unvoices or silence part
figure; plot(frames(40,:));title('unvoiced/silence part');
figure;
autocorr(frames(40,:),length(frames(40,:)) -1);
figure; plot(abs(fft(frames(50,:))));