function [rp_time]=trialGenerator(fg, condition_list)
%% >>>> Description:
%   Generate trial window as defined by condition
%   Need subject click when they detect the target stimulus
%% >>>> Input Args
%   condition_list = [cue_time, cue_vd, cue_coor, tg_coor, cue_side];
%   "cue_time": cue internals
%           0.1s / 0.3s
%   "cue_vd": valid cue or not
%           0 - invalid; 1 - valid;
%   "cue_coor": cue center coordinate
%           [cue_x, cue_y]
%   "tg_coor": target coordinate
%           [tg_x, tg_y]
%   "cue_side": whether cue and target are at the same side
%           0 - opposite side; 1 - same side
%
%% >>>> Output Args
%   "rp_time": response time( Display of picture ~ Subject response)
%
%% >>>> Parameters and Coordinate
cue_time = condition_list(1);
cue_coor = condition_list(3:4);
tg_coor = condition_list(5:6);

cue_length = 1;
cue_coor = cue_coor - cue_length/2;

%% >>>> Draw Trial

set(fg,"Color","w");
axis off;
hold on;
xlim([0,7]);
ylim([0,7]);
 % fixation cross
% plot([3.5, 3.5],[3, 4],"-r","LineWidth",4);
% plot([3, 4],[3.5, 3.5],"-r","LineWidth",4);
plot([3.5, 3.5],[3.2, 3.8],"-r","LineWidth",4);
plot([3.3, 3.7],[3.5, 3.5],"-r","LineWidth",4);

% pause;

% Cue square
rectangle('Position',[cue_coor(1),cue_coor(2),cue_length,cue_length],'EdgeColor',[0,0,1],'LineWidth',1);
pause(cue_time);
% rectangle('Position',[cue_coor(1),cue_coor(2),cue_length,cue_length],'EdgeColor',[1,1,1],'LineWidth',1);

% % pause random time
% rand_pause = rand(1)+1;
% pause(rand_pause);
% target stimulus
plot(tg_coor(1), tg_coor(2), "b.","MarkerSize",10); %% first expr in 20 size

%% .............. Subject Response ..................
tic;
pause; 
get(fg,"CurrentCharacter");
rp_time=toc;
clf;
% close(gcf);

end

