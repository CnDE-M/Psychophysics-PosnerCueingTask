function [expr_paras] = parameterGenerator()
%% >>>> discription:
% The function is to generate 6 type of condition parameters list for each experiments 
%% >>>> input arg:
% 
%% >>>> output arg:
%  "expr_parameters": parameter list 
%   [cue_time, cue_vd, cue_coor, tg_coor, cue_side];
%   "cue_time": cue internals
%   "cue_vd": valid cue or not
%           0 - invalid; 1 - valid;
%   "cue_coor": cue center coordinate
%           [cue_x, cue_y]
%   "tg_coor": target coordinate
%           [tg_x, tg_y]
%   "cue_side": whether cue and target are at the same side
%           0 - opposite side; 1 - same side

trialPerSite = 4; % cue present at each grid for equal times
gridSize = 6; % 6¡Á6 grids
gridNum = gridSize * gridSize;
% cue_time_list =[0.5, 1];
cue_time_list =[0.8, 1.2]+1;

%% "cue_time" - expr_paramters(:,1)
expr_paras(:,1) = repelem(cue_time_list,[gridNum * trialPerSite * 2, gridNum * trialPerSite * 2])';

%% "cue_valid" - expr_paramters(:,2)
expr_paras(:,2) = repmat( repelem([1,0],[gridNum * trialPerSite]) ,[1,2])';

%% "cue_coor" - expr_paras(:,3:4) :
cue_coor = fullfact([gridSize,gridSize]);
% % repeat 4 times
% cue_coor_num = size(cue_coor,1);
% repeat_seq = 1:cue_coor_num;
% repeat_seq = repelem(repeat_seq,repelem(4, cue_coor_num));
expr_paras(:,3:4) =  repmat(cue_coor,[trialPerSite * 2 *length(cue_time_list),1]);

%% "tg_coor" - expr_paras(:,5:6) :
tg_coor_valid = repmat(cue_coor,[trialPerSite,1]); % valid cue at the same region with target
tg_coor_invalid_left = [randi(6,[gridNum*2,1]), randi(3,[gridNum*2,1])];
tg_coor_invalid_right = [randi(6,[gridNum*2,1]), randi(3,[gridNum*2,1])+3];
tg_coor_invalid = [tg_coor_invalid_left;tg_coor_invalid_right];

expr_paras(:,5:6) = repmat ([tg_coor_valid;tg_coor_invalid],[length(cue_time_list),1]);

% !!! notice the invalid record may has valid cue
% update the validation of cue
cue_vd = [expr_paras(:,3) == expr_paras(:,5) & expr_paras(:,4) == expr_paras(:,6)];
expr_paras(:,2) = cue_vd;

%% "cue_side" - expr_paras(:,7):
cue_LeftSide = [expr_paras(:,3) <=3];
tg_LeftSide = [expr_paras(:,5) <=3];
expr_paras(:,7)= [cue_LeftSide == tg_LeftSide];

%% randomize the sequence
expr_paras = expr_paras( randperm(size(expr_paras,1)),:);

end

