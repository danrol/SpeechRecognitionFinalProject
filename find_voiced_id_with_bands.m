function [voiced_id, unvoiced_id] = find_voiced_id_with_bands(ZCR_values_per_frame, f_energy_bands, zcr_threshold,ste_threshold, frames)

% VOICED DECISION TABLE
% EH < EM < EL          VOICED
% EH > EM > EL          UNVOICED
% EH > EL > && EL > EM  UNVOICED
% EM > EH && EH > EL    UNVOICED
% EM > EL && EL > EH    NOT SURE - ZCR Calculation
% EL > EH && EH > EM    NOT SURE - ZCR Calculation
% OTHERS                NOT SURE - ZCR Calculation
%
% ZCR Calculation
% ZCR > ZCR_Threshold   VOICED
% ELSE                  UNVOICED
num=0;
for i=1:size(frames,1)
    EL = f_energy_bands(i,1);
    EM = f_energy_bands(i,2);
    EH = f_energy_bands(i,3);
    
    if(EH < EM && EM < EL) % voiced
        num = num + 1;
        voiced_id(num) = i;
    elseif(EH > EM && EM > EL) % unvoiced
        continue;
    elseif(EH > EL && EL > EM) % unvoiced
        continue;
    elseif(EM > EH && EH > EL) % unvoiced
        continue;
    elseif(EM > EL && EL > EH) % not sure
        if(ZCR_values_per_frame(1,i) > zcr_threshold) % voiced
             num = num + 1;
             voiced_id(num) = i;
        end
    elseif(EL > EH && EH > EM) % not sure
        if(ZCR_values_per_frame(1,i) > zcr_threshold ) % voiced
             num = num + 1;
             voiced_id(num) = i;
        end
    else
        if(ZCR_values_per_frame(1,i) > zcr_threshold ) % voiced
             num = num + 1;
             voiced_id(num) = i;
        end
    end
end

unvoiced_id = reshape(1:size(frames), 1, []); %create vector filled with numbers 
unvoiced_id = setdiff(unvoiced_id, voiced_id); %change vector to be every frame that is unvoiced
