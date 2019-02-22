function [voiced_unvoiced_per_frame] = find_voiced_id( ZCR_values_per_frame, f_energy_vector , ZCR_threshold, f_energy_vector_threshold)

voiced_unvoiced_per_frame = find((f_energy_vector > f_energy_vector_threshold) & (ZCR_values_per_frame < ZCR_threshold));
