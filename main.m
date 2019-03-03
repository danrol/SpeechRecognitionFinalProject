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
zcr_threshold = 0.3;

frames = framing(data, fs, f_d);
% get ZCR per frame
ZCR_values_per_frame = ZCR(frames);
% get energy per frame
f_energy_vector = STECalc(frames);
f_energy_bands = BandSTECalc(frames);

%% determines which frames contains voice

%% Method 1
% based on article
% Separation of Voiced and Unvoiced using Zero crossing rate and Energy of the Speech Signal  Bachu R.G., Kopparthi S., Adapa B., Barkana B.D.
% https://www.researchgate.net/publication/259828967_Separation_of_Voiced_and_Unvoiced_Speech_Signals_using_Energy_and_Zero_Crossing_Rate


[voiced_id,unvoiced_id] = find_voiced_id(ZCR_values_per_frame, f_energy_vector, zcr_threshold, ste_threshold, frames);

%% Method 2
% Based on article :
% A Method for Voiced/Unvoiced Classification of Noisy
% Speech by Analyzing Time-Domain Features of
% Spectrogram Image
% ISSN: 2326-9065 (Print); ISSN: 2326-9073 (Online)
% by Kazi Mahmudul Hassan, Ekramul Hamid, Khademul Islam Molla2
% https://pdfs.semanticscholar.org/86df/1a9f7beffc9e450af9e2b179c9c55174d007.pdf
%
% change zcr threshold
% method 1 works better

%[voiced_id,unvoiced_id] = find_voiced_id_with_bands(ZCR_values_per_frame, f_energy_bands, zcr_threshold,ste_threshold, frames);


%% separate voiced/unvoiced data
[data_voiced, data_unvoiced] = getVoicedData(frames, voiced_id, unvoiced_id);

% returns table of frames and if they are voiced or not
voiced_frames = return_voiced_unvoiced_timings(voiced_id, unvoiced_id, f_d, frames);
% plot
plotVoiced(voiced_frames,data,frames);

% sound the data :
%% data_voiced | data_unvoiced | data
sound(data_voiced, fs);


