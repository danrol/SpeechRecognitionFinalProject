function voiced_frame = return_voiced_unvoiced_timings(voiced_id, unvoiced_id, f_d, frames)
% returns a table col 1 is frame, col 2 indicates voices/unvoices
% 1 - voiced, 0 - unvoiced


[r_voiced, c] = size(voiced_id);
[r_unvoiced, c] = size(unvoiced_id);
voiced_frame = zeros(r_voiced + r_unvoiced, 2);
[r, c] = size(frames);


for i=1:r
    if ismember(i, unvoiced_id)
        voiced_frame(i, 1) = f_d * i;
        voiced_frame(i, 2) = 0;
    else
        voiced_frame(i, 1) = f_d * i;
        voiced_frame(i, 2) = 1;
    end 
end
        

