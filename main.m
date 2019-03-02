close all; clear all;
% read sound 
[data, fs] = audioread('MySonIsLost.wav');
% normalize data
data = data / abs(max(data));
%frame duration
f_d = 0.010; 
%min energy
ste_threshold = 0.005;
%max zero-crossing rate
zcr_threshold = 0.6;

frames = framing(data, fs, f_d);

% get ZCR per frame
ZCR_values_per_frame = ZCR(frames, f_d, fs, data);

% get energy per frame
f_energy_vector =  STECalc(frames);

%zcr_threshold = mean(ZCR_values_per_frame); %take average ZCR as threshold

%% determines which frames contains voice
[voiced_id,unvoiced_id] = find_voiced_id(ZCR_values_per_frame, f_energy_vector, zcr_threshold, ste_threshold, frames);

%% separate voiced/unvoiced data
[data_voiced, data_unvoiced] = getVoicedData(frames, voiced_id, unvoiced_id);

% returns table of frames and if they are voiced or not
voiced_frames = return_voiced_unvoiced_timings(voiced_id, unvoiced_id, f_d, frames);
% plot
plotVoiced(voiced_frames,data,frames);

% sound the data :
%% data_voiced | data_unvoiced | data
sound(data_voiced, fs);





