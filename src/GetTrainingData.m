function GetTrainingData(all_ftypes, np, nn)
    LoadSaveImData('TrainingImages/FACES', np, 'FaceData');
    LoadSaveImData('TrainingImages/NFACES',nn,'NonFaceData');
    ComputeSaveFData(all_ftypes,'FeaturesToUse' );
end

