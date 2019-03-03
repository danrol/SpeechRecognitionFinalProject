function [data_voiced, data_unvoiced] = getVoicedData(frames, voiced_id, unvoiced_id)

fr_voiced = frames(voiced_id,:);
fr_unvoiced = frames(unvoiced_id,:);

data_voiced = reshape(fr_voiced',1,[]);
data_unvoiced = reshape(fr_unvoiced',1,[]);