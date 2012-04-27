function GetTrainingData(all_ftypes, np, nn)
    LoadSaveImData('TrainingImage/FACES', np, 'FaceData');
    LoadSaveImData('TrainingImage/NFACES',nn,'NonFaceData');
    ComputeSaveFData(all_ftypes,'FeaturesToUse' );




end

