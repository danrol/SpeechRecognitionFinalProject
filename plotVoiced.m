function plotVoiced(voiced_frames,data,frames)
[num_frames,frame_size] = size(frames);
voiced_data = data;
unvoiced_data = data;

for i=1:num_frames
    index = i*frame_size;
    if (voiced_frames(i,2) == 1)
        voiced_data(index:(index+frame_size)) = NaN;
    else
        unvoiced_data(index:(index+frame_size)) = NaN;
    end
end

plot(voiced_data,'g');hold on;plot(unvoiced_data,'b')
title ("Blue - voiced part, green - unvoiced part");

