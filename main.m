
close all; clear all;

% read sound 
[data, fs] = audioread('shee_mono.wav');
% normalize data
data = data / abs(max(data));

Tw = 25;                % analysis frame duration (ms)
Ts = 10;                % analysis frame shift (ms)

Nw = round( 1E-3*Tw*fs );    % frame duration (samples)
Ns = round( 1E-3*Ts*fs );    % frame shift (samples)

f_d = 0.025

%[frames, ~] = vec2frames( data, Nw, Ns, 'rows', @hamming, false); 
frames = framing(data, fs, f_d);
ZCR_values_per_frame = ZCR(frames, f_d, fs, data);
f_energy_vector =  STECalc(frames);

ste_threshold = 0.01;
zcr_threshold = 0.2;

voiced_unvoiced_per_frame = find_voiced_unvoiced(frames, ZCR_values_per_frame, f_energy_vector, zcr_threshold, ste_threshold);