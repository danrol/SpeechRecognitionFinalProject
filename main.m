
close all; clear all;

% read sound 
[data, fs] = audioread('shee.wav');
% normalize data
data = data / abs(max(data));

Tw = 25;                % analysis frame duration (ms)
Ts = 10;                % analysis frame shift (ms)

Nw = round( 1E-3*Tw*fs );    % frame duration (samples)
Ns = round( 1E-3*Ts*fs );    % frame shift (samples)

f_d = 0.025

%[frames, ~] = vec2frames( data, Nw, Ns, 'rows', @hamming, false); 
frames = primitive_framing(data, fs);
ZCR(frames, f_d, fs, data);

