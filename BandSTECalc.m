function bandSTE = BandSTECalc(frames)

% returns STE - Energy for each band in frames
% EH- High Band, EM - Mid Band, EL - Low Band

TH1 = 1200; % Low band 1 - 1200Hz
TH2 = 3000; % Mid band 1200 - 3000Hz
TH3 = 4000; % High band 3000 - 4000Hz

r = size(frames,1);
bandSTE = zeros(r, 3);
for i = 1:r
    frame_fft = fft(frames(i,:),TH3); % do fft for each frame
    frame_fft = abs(frame_fft);
    LB = frame_fft(1,1:TH1);
    MB = frame_fft(1,TH1:TH2);
    HB = frame_fft(1,TH2:TH3);
    bandSTE(i, 1) = sum(LB);
    bandSTE(i, 2) = sum(MB);
    bandSTE(i, 3) = sum(HB);
end