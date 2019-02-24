
close all; clear all;

% read sound 
[data, fs] = audioread('shee_mono.wav');
% normalize data
data = data / abs(max(data));

f_d = 0.025

%[frames, ~] = vec2frames( data, Nw, Ns, 'rows', @hamming, false); 
frames = framing(data, fs, f_d);
ZCR_values_per_frame = ZCR(frames, f_d, fs, data);
f_energy_vector =  STECalc(frames);

ste_threshold = 0.01;
%zcr_threshold = 0.2;
zcr_threshold = mean(ZCR_values_per_frame); %take average ZCR as threshold

voiced_id = find_voiced_id(ZCR_values_per_frame, f_energy_vector, zcr_threshold, ste_threshold);

unvoiced_id = reshape(1:size(frames), 1, []); %create vector filled with numbers 1...96 in order
unvoiced_id = setdiff(unvoiced_id, voiced_id); %change vector to be every frame that is unvoiced

%plot(data(frames(voiced_id)), 'g', data(frames(unvoiced_id), 'b');
fr_unvoiced = frames(unvoiced_id,:); 
data_unvoiced = reshape(fr_unvoiced',1,[]);

fr_voiced = frames(voiced_id,:); 
data_voiced = reshape(fr_voiced',1,[]);

%figure
%plot(data); hold on;
%plot(data_unvoiced, 'b'); 
%plot(data_voiced, 'g');
%sound(data_voiced, fs);
%title ("Blue - original data, green - voiced areas after unvoiced deleted");
[ voiced_timing, unvoiced_timing ] = return_voiced_unvoiced_timings(voiced_id, unvoiced_id, f_d, frames);


subplot(2,1,1)
plot(data)
title('Original Audio Data')

subplot(2,1,2)
plot(data_voiced, 'g')
title('Only voiced part')




