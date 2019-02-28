close all; clear all;
% read sound 
[data, fs] = audioread('MySonIsLost.wav');
% normalize data
data = data / abs(max(data));
%frame duration
f_d = 0.010; 
%min energy
ste_threshold = 0.01;
%max zero-crossing rate
zcr_threshold = 0.2;

frames = framing(data, fs, f_d);

ZCR_values_per_frame = ZCR(frames, f_d, fs, data);
f_energy_vector =  STECalc(frames);

%% determines which frames contains voice
voiced_id = find_voiced_id(ZCR_values_per_frame, f_energy_vector, zcr_threshold, ste_threshold);

%% separate voiced/unvoiced data
unvoiced_id = reshape(1:size(frames), 1, []); %create vector filled with numbers 
unvoiced_id = setdiff(unvoiced_id, voiced_id); %change vector to be every frame that is unvoiced

fr_voiced = frames(voiced_id,:); 
fr_unvoiced = frames(unvoiced_id,:); 

data_voiced = reshape(fr_voiced',1,[]);
data_unvoiced = reshape(fr_unvoiced',1,[]);

sound(data_voiced, fs);

voiced_frames = return_voiced_unvoiced_timings(voiced_id, unvoiced_id, f_d, frames);

plotVoiced(voiced_frames,data,frames);




