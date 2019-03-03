close all; clear all;
% read sound 
%[data, fs] = audioread('bad.wav');
%[data, fs] = audioread('bed.wav');
%[data, fs] = audioread('come_here_usual.wav');
%[data, fs] = audioread('ImTooOldForThis.wav');
%[data, fs] = audioread('MyNameIsBojan.wav'); %long recording - takes a few
%mins
%
[data, fs] = audioread('SheHad.wav');
%[data, fs] = audioread('OhMySon.wav');
%[data, fs] = audioread('shee_mono.wav');
%[data, fs] = audioread('SheHas_me.wav');

% normalize data
data = data / abs(max(data));

%frame duration
f_d = 0.01; % Seconds
%min energy
ste_threshold = 0.05;
%max zero-crossing rate
zcr_threshold = 0.2;

frames = framing(data, fs, f_d);
% get ZCR per frame
ZCR_values_per_frame = ZCR(frames);
% get energy per frame
f_energy_vector = STECalc(frames);
f_energy_bands = BandSTECalc(frames);

%% determines which frames contains voice

% method 1
%[voiced_id,unvoiced_id] = find_voiced_id(ZCR_values_per_frame, f_energy_vector, zcr_threshold, ste_threshold, frames);

% method 2
%
[voiced_id,unvoiced_id] = find_voiced_id_with_bands(ZCR_values_per_frame, f_energy_bands, zcr_threshold,ste_threshold, frames);


%% separate voiced/unvoiced data
[data_voiced, data_unvoiced] = getVoicedData(frames, voiced_id, unvoiced_id);

% returns table of frames and if they are voiced or not
voiced_frames = return_voiced_unvoiced_timings(voiced_id, unvoiced_id, f_d, frames);
% plot
plotVoiced(voiced_frames,data,frames);

% sound the data :
%% data_voiced | data_unvoiced | data
sound(data_voiced, fs);


