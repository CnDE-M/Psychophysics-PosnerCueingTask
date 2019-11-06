%% //////////////////////////// Introduction ////////////////////////////
% reference <MATLAB for neuroscientist 2nd> Project 7
% (Posner,1980)
%
% This script contains: generating experiments, collecting response.
%
% The experiments sessions include:
%   Cues are present 4 times in each grid (144 trial in total);
% 	2 times for valid cue, 2 for unvalid cue,
% 	Cue Intervals include 100 ms and 300 ms, number of each is equal.
%   Trials display in random sequence;
% 	Total trial numbers: 
% 	36 grids ¡Á 4 repetition ¡Á 2(valid or not) ¡Á 2 (internals) = 576. 

% Responses and data includes:
%       vision search type, stimulus number, target or not, response, response time 
% All records will be saved in one excel per subject
%
%% /////////////// ALL ASSEIGNMENT INCLUDE THIS SESSION ///////////////
%
%   Title: 
%         Feature & Conjunction Vision Search Experiment
%   Script File: 
%         Project_6_4_visual_search.m
%         Project_6_4_result_process.m
%   Function File:
%         trialGenerator.m
%
%% /////////////////////////////////////////////////////////////////////////
%   Author: Xinyue Ma
%   Email: 1653515@tongji.edu.cn
%
%   MATLAB version: R2019a
%% /////////////////////////////////////////////////////////////////

clear;
close all
clc;

%% Generate experiment parameters
[expr_paras] = parameterGenerator();


%% Load each trial
fprintf(" ~~~~~~~~~~~~~~~ Posner Cueing Task ~~~~~~~~~~~~~~~` \n");
fprintf('>>>> Focus on red cross first, press when ready \n');
fprintf('>>>> Press "space" once dectecting target stimulus \n');
fprintf("-----------------------------------------\n");
subject_name=input("Input your name:\n","s");
output_filename="Exercise_7_"+subject_name+".xlsx";
fprintf("-----------------------------------------\n");
fprintf('Press Any Key to Start when ready...\n '); 
pause;

fg=figure("Position",[100 10 1000 650]);

for ii = 1:size(expr_paras,1)
    
    if mod(ii,50)==0 % for every 50 trials, subject could rest
        pause;
        fprintf(" ~~~~~~~~~~~~~~~~~~~~~~` \n");
        fprintf(" Rest For A While. \n");
        fprintf(" ~~~~~~~~~~~~~~~~~~~~~~` \n");
        fprintf(" Press Any Key To Restart. \n");
        fprintf(" ~~~~~~~~~~~~~~~~~~~~~~` \n");
    end
        
    condition_list = expr_paras(ii,:);
    record = condition_list;
    record(length(record)+1) = trialGenerator(fg, condition_list);
    result(ii,:) = record;   
    
end
hold off;

xlswrite(output_filename,result);
