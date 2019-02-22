function [voiced_unvoiced_per_frame] = find_voiced_unvoiced( frames, ZCR_values_per_frame, f_energy_vector , ZCR_threshold, f_energy_vector_threshold)

[r, c] = size(frames);
voiced_unvoiced_per_frame = zeros(1, r);
for i = 1 : r
    if ((f_energy_vector(i) > f_energy_vector_threshold) && (ZCR_values_per_frame(i) < ZCR_threshold))
        voiced_unvoiced_per_frame(i) = 1;
    end
end