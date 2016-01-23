function [response] = Extension(trialNo)
% Play 1 trial of extension MannerPath experiment.
% Only bias test - show M1P1 movie; take a forced choice response between M1P2
% and M2P1.

global parameters
    
    %Ext movies 
    movietoplay_extAmbigVid = strcat('Movies/', char(parameters.extBiasVid(trialNo)));
    movietoplay_extPath = strcat('Movies/', char(parameters.extTestPathVid(trialNo)));
    movietoplay_extManner = strcat('Movies/', char(parameters.extTestMannerVid(trialNo)));

    %Ext audio
    soundtoplay_extWhichOne = strcat('Audio_stimuli_creation/Finished/', char(parameters.extWhichOne(trialNo)));
    soundtoplay_extLetsFind = strcat('Audio_stimuli_creation/Finished/aa_lets_find/', char(parameters.extLetsFind(trialNo)));
    soundtoplay_extAmbigAudioPast = strcat('Audio_stimuli_creation/Finished/', char(parameters.extAmbigAudioPast(trialNo)));
    soundtoplay_extAmbigAudioFuture = strcat('Audio_stimuli_creation/Finished/', char(parameters.extAmbigAudioFuture(trialNo)));
   
    %Ext stars
    extStarImage = strcat('stars/', char(parameters.extStarImage(trialNo)));
       
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLAY BIAS TEST VIDEO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    Show_Blank;

        Play_Sound(soundtoplay_extAmbigAudioFuture, 'toBlock');
    
        PlayCenterMovie(movietoplay_extAmbigVid);
        
%     imageArray = imread(char(parameters.greySquare));
%     rect =  [0 0 1 1]
%     winPtr = parameters.scr.winPtr;   
%     Screen('PutImage', winPtr , imageArray, rect );    
%     Screen('flip',winPtr)
%     resp1 = Take_Response(); %just moving on...
%     Show_Blank;
        
          
        PlayCenterMovie(movietoplay_extAmbigVid);
        Show_Blank;

        Play_Sound(soundtoplay_extAmbigAudioPast, 'toBlock');
        
        Show_Blank; 
  
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % TEST
    % Play the two event movies; movie always plays L then R
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Show_Blank;
    
    Play_Sound(soundtoplay_extLetsFind, 'toBlock');
    Show_Blank;      
           
    %Using the human-interpretable side variables instead...
    if parameters.mannerSideExt(trialNo) == 'L'
        PlaySideMovies(movietoplay_extManner,'');
        PlaySideMovies('',movietoplay_extPath);
    elseif parameters.mannerSideExt(trialNo) == 'R'
        PlaySideMovies(movietoplay_extPath,'');
        PlaySideMovies('',movietoplay_extManner);
    end
        

    %And take a response
    Play_Sound(soundtoplay_extWhichOne, 'toBlock');
    
    parameters.extFinalTestAns{trialNo} = Take_Response();
    parameters.extFinalTestEnd(trialNo) = GetSecs;
  


    
%%%%%%%%%%%%%%%%%%%%%%
% SHOW A NICE REWARD PICTURE
%%%%%%%%%%%%%%%%%%%%%%

    imageArray = imread(char(parameters.extStarImage(trialNo)));
    rect = parameters.scr.rect;
    winPtr = parameters.scr.winPtr;   
    Screen('PutImage', winPtr , imageArray, rect );    
    Screen('flip',winPtr)
    resp1 = Take_Response(); %just moving on...
    Show_Blank;
    
    
end




