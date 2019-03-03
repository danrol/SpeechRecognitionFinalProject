function [voiced_id, unvoiced_id] = find_voiced_id(ZCR_values_per_frame, f_energy_vector , ZCR_threshold, f_energy_vector_threshold, frames)

voiced_id = find((f_energy_vector > f_energy_vector_threshold) & (ZCR_values_per_frame < ZCR_threshold));
unvoiced_id = reshape(1:size(frames), 1, []); %create vector filled with numbers
unvoiced_id = setdiff(unvoiced_id, voiced_id); %change vector to be every frame that is unvoiced
