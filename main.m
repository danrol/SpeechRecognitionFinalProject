
close all; clear all;

% read sound 
[data, fs] = audioread('shee_mono.wav');
% normalize data
data = data / abs(max(data));

Tw = 20;                % analysis frame duration (ms)
Ts = 10;                % analysis frame shift (ms)

Nw = round( 1E-3*Tw*fs );    % frame duration (samples)
Ns = round( 1E-3*Ts*fs );    % frame shift (samples)

[frames, indexes] = vec2frames( data, Nw, Ns, 'cols', @hamming, false); 

counter = ZCR(frames);

