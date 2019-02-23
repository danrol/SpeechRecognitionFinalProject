function [ voiced_timing, unvoiced_timing ] = return_voiced_unvoiced_timings(voiced_id, unvoiced_id, f_d, frames)

[r_voiced, c] = size(voiced_id);
voiced_timing = zeros(r_voiced, 2);

[r_unvoiced, c] = size(unvoiced_id);
unvoiced_timing = zeros(r_unvoiced, 2);

[r, c] = size(frames);

unvoiced_index = 1;
voiced_index = 1;
for i=1:r
    if ismember(i, unvoiced_id)
        unvoiced_timing(unvoiced_index, 1) = f_d * i;
        unvoiced_timing(unvoiced_index, 2) = f_d * i +f_d;
        unvoiced_index = unvoiced_index +1;
    else
        voiced_timing(voiced_index, 1) = f_d * i;
        voiced_timing(voiced_index, 2) = f_d * i +f_d;
        voiced_index = voiced_index + 1;
    end 
end
        

