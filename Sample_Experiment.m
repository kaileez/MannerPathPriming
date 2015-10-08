function Sample_Experiment(subNo, condition)

%Code based on sign meaning experiment, Feb 2014
%                         
%subNo, the subject number to run. Subject code above
%99 is for testing; data overwrite will not be checked.
%
%
%condition, one of 6 set lists of items, specify 1-6
% 1= MannerOfMotionCondition
% 2= MannerOfMotionCondition_Instrumental
% 3= PathCondition
% 4= PathCondition_Instrumental
% 5= EffectCondition
% 6= MeansCondition

addpath('HelperFunctions')

global parameters

parameters.datafilepointer = AssignDataFile('SampleExp',subNo);

try
    
    disp('Hey!')
    
    %%%%%%%%%%%%%%%%%%%%%%
    % Parameter Setting
    %%%%%%%%%%%%%%%%%%%%%%
    
    % PsychTool setup
    Setup_PTool();
    SetParameters();
     
    % Restrict keyboard
    KbName('UnifyKeyNames')
    parameters.space=KbName('space');
    parameters.esc=KbName('ESCAPE');
    parameters.z_press=KbName('z');
    parameters.c_press=KbName('c');
    parameters.q_press=KbName('q');
    parameters.x_press=KbName('x');
    parameters.r_press=KbName('r');
    
    % Sets specific values for this participant
    parameters.subNo = subNo;
    
    %Read the file into matlab
    vidNames = read_mixed_csv('Experiment_Items_10_08.csv',',')
    
    %Routine to pick the specified signList (algebra to get us the right rows)
    start_Index = (8*condition)-6;
    end_Index = (8*condition)+1;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     %Turn list into vectors of variables
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    parameters.Experiment = vidNames(start_Index:end_Index, 2)
    parameters.amyFileName = vidNames(start_Index:end_Index, 3)
    parameters.itemID = vidNames(start_Index:end_Index, 4)
    parameters.eventType = vidNames(start_Index:end_Index, 5)
    parameters.Condition = vidNames(start_Index:end_Index, 6)
    parameters.Manner = vidNames(start_Index:end_Index, 7)
    parameters.Path = vidNames(start_Index:end_Index, 8)
    parameters.verbName = vidNames(start_Index:end_Index, 9)
    parameters.verbMeaning = vidNames(start_Index:end_Index, 10)
    parameters.ambigS_not_recording = vidNames(start_Index:end_Index, 11)
    parameters.ambig_going_to = vidNames(start_Index:end_Index, 12)
    parameters.ambig_did_it = vidNames(start_Index:end_Index, 13)
    parameters.ambigV = vidNames(start_Index:end_Index, 14)
    parameters.which_one = vidNames(start_Index:end_Index, 15)
    parameters.mbiasV = vidNames(start_Index:end_Index, 16)
    parameters.mbiasAns = vidNames(start_Index:end_Index, 17)
    parameters.pbiasV = vidNames(start_Index:end_Index, 18)
    parameters.pbiasAns = vidNames(start_Index:end_Index, 19)
    parameters.trainS1_not_recording = vidNames(start_Index:end_Index, 20)
    parameters.trainS1_going_to = vidNames(start_Index:end_Index, 21)
    parameters.trainS1_did_it = vidNames(start_Index:end_Index, 22)
    parameters.trainV1 = vidNames(start_Index:end_Index, 23)
    parameters.trainS2_not_recording = vidNames(start_Index:end_Index, 24)
    parameters.trainS2_going_to = vidNames(start_Index:end_Index, 25)
    parameters.trainS2_did_it = vidNames(start_Index:end_Index, 26)
    parameters.trainV2 = vidNames(start_Index:end_Index, 27)
    parameters.trainS3_not_recording = vidNames(start_Index:end_Index, 28)
    parameters.trainS3_going_to = vidNames(start_Index:end_Index, 29)
    parameters.trainS3_did_it = vidNames(start_Index:end_Index, 30)
    parameters.trainV3 = vidNames(start_Index:end_Index, 31)
    parameters.which_one_not_recording = vidNames(start_Index:end_Index, 32)
    parameters.mtestV = vidNames(start_Index:end_Index, 33)
    parameters.mtestAns = vidNames(start_Index:end_Index, 34)
    parameters.ptestV = vidNames(start_Index:end_Index, 35)
    parameters.ptestAns = vidNames(start_Index:end_Index, 36)
    parameters.movieLenght = vidNames(start_Index:end_Index, 37)
    parameters.LeftMovie = vidNames(start_Index:end_Index, 38)
    parameters.ambigAudioFuture = vidNames(start_Index:end_Index, 40)
    parameters.ambigAudioPast = vidNames(start_Index:end_Index, 41)
    parameters.trainAudioFuture1 = vidNames(start_Index:end_Index, 42)
    parameters.trainAudioPast1 = vidNames(start_Index:end_Index, 43)
    parameters.trainAudioFuture2 = vidNames(start_Index:end_Index, 44)
    parameters.trainAudioPast2 = vidNames(start_Index:end_Index, 45)
    parameters.trainAudioFuture3 = vidNames(start_Index:end_Index, 46)
    parameters.trainAudioPast3 = vidNames(start_Index:end_Index, 47)
    parameters.whichOne = vidNames(start_Index:end_Index, 48)
    parameters.letsFind_Audio = vidNames(start_Index:end_Index, 49)
    parameters.starimage = vidNames(start_Index:end_Index, 50)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % % % Now randomize everything (apply random order to all columns/objects)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    myRandOrder = randperm(8)
    
    parameters.Experiment = parameters.Experiment(myRandOrder)
    parameters.amyFileName = parameters.amyFileName(myRandOrder)
    parameters.itemID = parameters.itemID(myRandOrder)
    parameters.eventType = parameters.eventType(myRandOrder)
    parameters.Condition = parameters.Condition(myRandOrder)
    parameters.Manner = parameters.Manner(myRandOrder)
    parameters.Path = parameters.Path(myRandOrder)
    parameters.verbName = parameters.verbName(myRandOrder)
    parameters.verbMeaning = parameters.verbMeaning(myRandOrder)
    parameters.ambigS_not_recording = parameters.ambigS_not_recording(myRandOrder)
    parameters.ambig_going_to = parameters.ambig_going_to(myRandOrder)
    parameters.ambig_did_it = parameters.ambig_did_it(myRandOrder)
    parameters.ambigV = parameters.ambigV(myRandOrder)
    parameters.which_one = parameters.which_one(myRandOrder)
    parameters.mbiasV = parameters.mbiasV(myRandOrder)
    parameters.mbiasAns = parameters.mbiasAns(myRandOrder)
    parameters.pbiasV = parameters.pbiasV(myRandOrder)
    parameters.pbiasAns = parameters.pbiasAns(myRandOrder)
    parameters.trainS1_not_recording = parameters.trainS1_not_recording(myRandOrder)
    parameters.trainS1_going_to = parameters.trainS1_going_to(myRandOrder)
    parameters.trainS1_did_it = parameters.trainS1_did_it(myRandOrder)
    parameters.trainV1 = parameters.trainV1(myRandOrder)
    parameters.trainS2_not_recording = parameters.trainS2_not_recording(myRandOrder)
    parameters.trainS2_going_to = parameters.trainS2_going_to(myRandOrder)
    parameters.trainS2_did_it = parameters.trainS2_did_it(myRandOrder)
    parameters.trainV2 = parameters.trainV2(myRandOrder)
    parameters.trainS3_not_recording = parameters.trainS3_not_recording(myRandOrder)
    parameters.trainS3_going_to = parameters.trainS3_going_to(myRandOrder)
    parameters.trainS3_did_it = parameters.trainS3_did_it(myRandOrder)
    parameters.trainV3 = parameters.trainV3(myRandOrder)
    parameters.which_one_not_recording = parameters.which_one_not_recording(myRandOrder)
    parameters.mtestV = parameters.mtestV(myRandOrder)
    parameters.mtestAns = parameters.mtestAns(myRandOrder)
    parameters.ptestV = parameters.ptestV(myRandOrder)
    parameters.ptestAns = parameters.ptestAns(myRandOrder)
    parameters.movieLenght = parameters.movieLenght(myRandOrder)
    parameters.LeftMovie = parameters.LeftMovie(myRandOrder)
    parameters.ambigAudioFuture = parameters.ambigAudioFuture(myRandOrder)
    parameters.ambigAudioPast = parameters.ambigAudioPast(myRandOrder)
    parameters.trainAudioFuture1 = parameters.trainAudioFuture1(myRandOrder)
    parameters.trainAudioPast1 = parameters.trainAudioPast1(myRandOrder)
    parameters.trainAudioFuture2 = parameters.trainAudioFuture2(myRandOrder)
    parameters.trainAudioPast2 = parameters.trainAudioPast2(myRandOrder)
    parameters.trainAudioFuture3 = parameters.trainAudioFuture3(myRandOrder)
    parameters.trainAudioPast3 = parameters.trainAudioPast3(myRandOrder)
    parameters.whichOne = parameters.whichOne(myRandOrder)
    parameters.letsFind_Audio = parameters.letsFind_Audio(myRandOrder)
    %parameters.starimage = parameters.starimage(myRandOrder)
    
    %Randomize sides for target and distractor movies
    parameters.LorR_bias = randi([0 1], length(start_Index:end_Index),1)
    parameters.LorR_final = randi([0 1], length(start_Index:end_Index),1)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Save a header file to the data file so it will be easier to read!
    WriteResultFile({'SubjectNo',...
        'trialNo',...
        'List',...
        'itemID',...
        'eventType',...
        'Condition',...
        'verbName',...
        'ambigV',...
        'mbiasV',...
        'pbiasV',...
        'mbiasAns',...
        'pbiasAns',...
        'RT biastest',...
        'trainV1',...
        'trainV2',...
        'trainV3',...
        'mtestV',...
        'mtestAns',...
        'ptestV',...
        'ptestAns',...
        'RT final test',...
        'movieLenght',...
        'side',...
        'Date',...
        'Time',...
        'Response',...
        'LorR_bias_test',...
        'LorR_final_test',...
        'ambigAudioFuture',...
        'ambigAudioPast',...
        'trainAudioFuture1',...
        'trainAudioPast1',...
        'trainAudioFuture2',...
        'trainAudioPast2',...
        'trainAudioFuture3',...
        'trainAudioPast3',...
        'whichOne',...
        'expStart',...
        'trainingStart',...
        'trainingEnd',...
        'finalTestTIme',...
        'finalEndTime',...
        'expEndTime',...
        'totalTime',...
        'biasTestAns',...
        'finalTestAns'});
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Text_Show('Press spacebar to start experiment.')
    Show_Blank();
    Take_Response();
    
    expStart = GetSecs;
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % 2 TRIALS OF NOUN TRAINING
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %Noun_Training
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Trial Setup
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % How many trials?
    % ntrials = length(parameters.pbiasV)
    ntrials = 1; %For the skeleton, play some short sample trials!
    
    Text_Show('Ready? Press space to watch the movies.');
    Take_Response();
    
    %Want to finish early?
%     if response == 'q'
%         
%         Closeout_PTool();
%         psychrethrow(psychlasterror);
%            
%         return
%         
%     end
    
    finishedSignMovie = 0;
    while not(finishedSignMovie)
        
        
        for i=1:ntrials
            response = Sample_Trial(i);
            
            if response == 'q'
                break
                
            end
            
            expEnd = GetSecs;
            totalTime = expEnd - expStart;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Write result file
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            WriteResultFile({parameters.subNo,...
                i,...
                'List',...
                parameters.itemID(i),...
                parameters.eventType(i),...
                'Condition',...
                parameters.verbName(i),...
                parameters.ambigV(i),...
                parameters.mbiasV(i),...
                parameters.pbiasV(i),...
                'mbiasAns',...
                parameters.pbiasAns(i),...
                'RT biastest',...
                parameters.trainV1(i),...
                parameters.trainV2(i),...
                parameters.trainV3(i),...
                parameters.mtestV(i),...
                'mtestAns',...
                parameters.ptestV(i),...
                'ptestAns',...
                'RT final test',...
                parameters.movieLenght(i),...
                'side',...
                datestr(now,'dd-mmm-yyyy'),...
                datestr(now,'HH:MM:SS.FFF'),...
                'Response',...
                parameters.LorR_bias(i),...
                parameters.LorR_final(i),...
                parameters.ambigAudioFuture(i),...
                parameters.ambigAudioPast(i),...
                parameters.trainAudioFuture1(i),...
                parameters.trainAudioPast1(i),...
                parameters.trainAudioFuture2(i),...
                parameters.trainAudioPast2(i),...
                parameters.trainAudioFuture3(i),...
                parameters.trainAudioPast3(i),...
                parameters.whichOne(i),...
                expStart,...
                parameters.trainingStart(i),...
                parameters.trainingEnd(i),...
                parameters.finalTest(i),...
                parameters.finalEnd(i),...
                expEnd,...
                totalTime,...
                parameters.biasTestAns(i),...
                parameters.finalTestAns(i)});
            
        end
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Cleanup & Shutdown
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        Closeout_PTool();
        
    end
    
catch
    
    Closeout_PTool();
    
    psychrethrow(psychlasterror);
    
end


