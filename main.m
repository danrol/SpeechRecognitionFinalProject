
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
zcr_threshold = 0.2;

voiced_id = find_voiced_id(ZCR_values_per_frame, f_energy_vector, zcr_threshold, ste_threshold);

unvoiced_id = reshape(1:size(frames), 1, []); %create vector filled with numbers 1...96 in order
unvoiced_id = setdiff(unvoiced_id, voiced_id); %change vector to be everything that is in unvoiced but not in voiced

%plot(data(voiced_id), 'g', data(~voiced_id), 'b'); 

