function  ZCRr1 = ZCR(frames)
% This file calculates short time Zero Crossing Rate (ZCR) of
% voice/unvoiced
% signal. or in other words finds Frame ZCR

%% finding ZCR of all frames
r = size(frames, 1);

ZCRf1 = zeros(1, r);

for i = 1 : r
    x = frames(i, :);
    for k = 1:length(x) - 1
        
        if ((x(k) <= 0) && (x(k + 1) > 0 ))
            ZCRf1(i) = ZCRf1(i) + 1;
            
        elseif ((x(k) >= 0) && (x(k + 1) < 0))
            ZCRf1(i) = ZCRf1(i) + 1;
        end
    end
    
end

% calculating rate
ZCRr1 = ZCRf1/length(x);
ZCRr1 = ZCRr1/max(ZCRr1);
