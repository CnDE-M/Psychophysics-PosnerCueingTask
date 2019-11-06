%% //////////////////////////// Introduction ////////////////////////////
% reference <MATLAB for neuroscientist 2nd> Project 7
% (Posner,1980)
%
% The script is to do statistic analysis on response time;
% (1) target dot size: 20
%     fix size: 1
%     cue intervals: [0.5, 1]
%
% (2) target dot size: 10
%     fix size: 0.6
%     cue intervals: [0.8, 1.2]
%
%% /////////////////////////////////////////////////////////////////////////
%   Author: Xinyue Ma
%   Email: 1653515@tongji.edu.cn
%
%   MATLAB version: R2019a
%% /////////////////////////////////////////////////////////////////

sbj_filename = ["Exercise_7_1.xlsx","Exercise_7_2.xlsx","Exercise_7_3.xlsx"];
for ii = 1:3
    dataPerFile(:,:,ii) = xlsread(sbj_filename(ii));
end


%% /////////////////////////////////////////////////
%% >>>> Cue Validation ~ RTs
hold on;
figure("Position",[10,50,1200,300]);
for ii = 1:3
    clear sub_RT_vd sub_RT_invd x_1 x_2 h p
    sub_RT_1 =  dataPerFile(dataPerFile(:,2,ii)==1, 8, ii); %% valid cue
    sub_RT_2 =  dataPerFile(dataPerFile(:,2,ii)==0, 8, ii); %% invalid cue
    
    %% Filter accident result 
    % RT>=1s
    sub_RT_1(sub_RT_1>=1)=[];
    sub_RT_2(sub_RT_2>=1)=[];
    
    %% bar image
    subplot(1,3,ii);
    x_1 = [1:size(sub_RT_1)]*0.01;
    x_2 = [size(sub_RT_1)+1:size(sub_RT_1)+size(sub_RT_2)]*0.01;
    bar(x_1,sub_RT_1',"r");
    hold on;
    bar(x_2,sub_RT_2',"b");
    xlim([min(x_1),max(x_2)]);
    ylim([0,1]);
    t="Round "+ string(ii);
    title(t);
    legend(["Valid Cue","Invalid Cue"],"Location","southeast");
    
    %% t-test
    [h,p] = ttest2(sub_RT_1, sub_RT_2,"Tail","left");
    % H0: valid >= invalid
    if h==0
        t_result = "Valid not significantly smaller than Invalid";
    else
        t_result = "Valid significantly smaller than Invalid";
    end
    text("String",t_result,"Color","k","Position",[0.1,0.96],"FontSize",7);
    text("String","p-value: "+string(p),"Color","k","Position",[0.1,0.91],"FontSize",7);

end
hold off;


%% /////////////////////////////////////////////////
%% >>>> Cue Intenal Length ~ RTs
hold on;
figure("Position",[10,50,1200,300]);
for ii = 1:3
    clear sub_RT_vd sub_RT_invd x_1 x_2 h p
    
    cue_time = unique(dataPerFile(:,1,ii));
    
    sub_RT_1 =  dataPerFile(dataPerFile(:,1,ii)==max(cue_time), 8, ii); %% Longer Cue
    sub_RT_2 =  dataPerFile(dataPerFile(:,1,ii)==min(cue_time), 8, ii); %% Shorter Cue
    
    %% Filter accident result 
    % RT>=1s
    sub_RT_1(sub_RT_1>=1)=[];
    sub_RT_2(sub_RT_2>=1)=[];
    
    %% bar image
    subplot(1,3,ii);
    x_1 = [1:size(sub_RT_1)]*0.01;
    x_2 = [size(sub_RT_1)+1:size(sub_RT_1)+size(sub_RT_2)]*0.01;
    bar(x_1,sub_RT_1',"r");
    hold on;
    bar(x_2,sub_RT_2',"b");
    xlim([min(x_1),max(x_2)]);
    ylim([0,1]);
    t="Round "+ string(ii);
    title(t);
    legend(["Longer Cue","Shorter Cue"],"Location","southeast");
    
    %% t-test
    [h,p] = ttest2(sub_RT_1, sub_RT_2,"Tail","left");
    % H0: valid >= invalid
    if h==0
        t_result = "Longer cue not significantly smaller than Shorter cue";
    else
        t_result = "Longer cue significantly smaller than Shorter cue";
    end
    text("String",t_result,"Color","k","Position",[0.1,0.96],"FontSize",7);
    text("String","p-value: "+string(p),"Color","k","Position",[0.1,0.91],"FontSize",7);

end
hold off;


%% /////////////////////////////////////////////////
%% >>>> Cue distance to target:
% Display distance by polar distance
hold on;
figure("Position",[10,50,1200,300]);
for ii = 1:3

    subplot(1,3,ii);
    sub_data = dataPerFile(:,[2,3,4,5,6,8],ii);
    %% Filter accident result 
    % RT>=1s
    sub_data(sub_data(:,6)>=1,:)=[];
    
    %% angle & radium distance
    sub_data(:,[2,3,4,5]) = sub_data(:,[2,3,4,5]) - 3.5;
    % cue
    [sub_data(:,7),sub_data(:,8)] = cart2pol(sub_data(:,2),sub_data(:,3));
    % target
    [sub_data(:,9),sub_data(:,10)] = cart2pol(sub_data(:,4),sub_data(:,5));   
    % trasfer arc to angle
   % sub_data(:,[7,9]) = sub_data(:,[7,9])/pi*180;
    
    angle_diff = abs(sub_data(:,9) - sub_data(:,7));
    rad_diff = abs(sub_data(:,10) - sub_data(:,8));
    diff_list = [angle_diff, rad_diff];
    
    plot3(angle_diff,rad_diff,sub_data(:,6)*10,".b","MarkerSize",5);
    hold on
    k = boundary(angle_diff,rad_diff,sub_data(:,6)*10);
    trisurf(k,angle_diff,rad_diff,sub_data(:,6)*10,'LineWidth',0.001,'FaceAlpha',0.1, "EdgeColor","interp")
%     zlim([0.4,1]);
%     zticks([0.4:0.05:1]);
    colormap(flip(autumn));
    view([-20,40])
    xlabel("angle difference");
    ylabel("radium difference");
    zlabel("response time(s) * 10");
    title("RTs ~ cue and target polar distance");
    
end
hold off;



%% /////////////////////////////////////////////////
%% >>>> Cue distance to focus:
% Euclidean distance
hold on;
figure("Position",[10,50,1200,300]);
for ii = 1:3
    clear sub_data 
    
    sub_data(:,1:4) = dataPerFile(:,[2,3,4,8],ii);
    %% Filter accident result 
    % RT>=1s
    sub_data(sub_data(:,4)>=1,:)=[];
        
    %% euclidean distance
    sub_data(:,5) = sqrt( [sub_data(:,2) - 3.5] .^2 +[sub_data(:,3) - 3.5] .^2 ) ;    
    eu_distance = sort(unique(sub_data(:,5)));

    for valid = 1:2
    % row 1 is invalid
    % row 2 is valid
        for jj = 1:length(eu_distance)
            clear RT
            RT = sub_data(sub_data(:,5)==eu_distance(jj) & sub_data(:,1)== (valid-1),4);
            ave_RT(valid,jj,ii) =  mean(RT);
            SEM_RT(valid,jj,ii) = std(RT) / sqrt(length(RT));            
        end

        % Pearson correlation
        [m,p]=corrcoef(ave_RT(valid,:,ii),eu_distance);
        magnitude(valid)=round(m(1,2),2);
        p_value(valid)= round(p(1,2),3);
    end
    
    %% plot
    % average & SEM
    eu_distance = round(eu_distance,2);
    subplot(1,3,ii);
    hold on;
    errorbar(eu_distance,ave_RT(1,:,ii), SEM_RT(1,:,ii),"-.r");
    text("String","mag.: "+string(magnitude(1))+" p-value: "+string(p_value(1)),"Color","r","Position",[0.1,0.45],"FontSize",7.5);
    errorbar(eu_distance,ave_RT(2,:,ii), SEM_RT(2,:,ii),"-.b");
    text("String","mag.: "+string(magnitude(2))+" p-value: "+string(p_value(2)),"Color","b","Position",[0.1,0.44],"FontSize",7.5);
    t="Round "+string(ii);
    title(t);
    xlim([0,4]);
    ylim([0.42,0.62]);
    xticks(eu_distance);
    xlabel("cue focus distance");
    ylabel("response time(s)");
    xtickangle(30);
    % xticklabels(string(eu_distance));
    legend(["Invalid Cue","Valid Cue"],"Location","southeast");

end
hold off;

%% >>>> RT_unvalid - RT_valid:
% Euclidean distance
hold on;
figure("Position",[10,50,1200,300]);
for ii = 1:3
    
    % Pearson correlation
    [m,p]=corrcoef(ave_RT(1,:,ii)-ave_RT(2,:,ii),eu_distance);
    magnitude=round(m(1,2),2);
    p_value= round(p(1,2),3);
   
    
    %% plot
    % average & SEM
    eu_distance = round(eu_distance,2);
    subplot(1,3,ii);
    hold on;
    plot(eu_distance,ave_RT(1,:,ii)-ave_RT(2,:,ii), "-.k","LineWidth",2);
    text("String","mag.: "+string(magnitude)+" p-value: "+string(p_value),"Color","r","Position",[0.15,0.015],"FontSize",8);
    t="Round "+string(ii);
    title(t);
    xlim([0,4]);
    ylim([0,0.09]);
    xticks(eu_distance);
    xlabel("cue focus distance");
    ylabel("RTs_{invalid}-RTs_{valid}");
    xtickangle(30);
    % xticklabels(string(eu_distance));
   
end
hold off;



%% /////////////////////////////////////////////////
%% >>>> Cue and Target at the same/opposite side
hold on;
figure("Position",[10,50,1200,300]);
for ii = 1:3
    clear sub_RT_vd sub_RT_invd x_1 x_2 h p
    
    cue_time = unique(dataPerFile(:,1,ii));
    
    sub_RT_1 =  dataPerFile(dataPerFile(:,7,ii)==1, 8, ii); %% same side
    sub_RT_2 =  dataPerFile(dataPerFile(:,7,ii)==0, 8, ii); %% opposite side
    
    %% Filter accident result 
    % RT>=1s
    sub_RT_1(sub_RT_1>=1)=[];
    sub_RT_2(sub_RT_2>=1)=[];
    
    %% bar image
    subplot(1,3,ii);
    x_1 = [1:size(sub_RT_1)]*0.01;
    x_2 = [size(sub_RT_1)+1:size(sub_RT_1)+size(sub_RT_2)]*0.01;
    bar(x_1,sub_RT_1',"r");
    hold on;
    bar(x_2,sub_RT_2',"b");
    xlim([min(x_1),max(x_2)]);
    ylim([0,1]);
    t="Round "+ string(ii);
    title(t);
    legend(["Same Side","Opposite Side"],"Location","southeast");
    
    %% t-test
    [h,p] = ttest2(sub_RT_1, sub_RT_2,"Tail","left");
    % H0: valid >= invalid
    if h==0
        t_result = "Same Side not significantly smaller than Opposite Side";
    else
        t_result = "Same Side significantly smaller than Opposite Side";
    end
    text("String",t_result,"Color","k","Position",[0.1,0.96],"FontSize",7);
    text("String","p-value: "+string(p),"Color","k","Position",[0.1,0.91],"FontSize",7);

    
    % text();    
end
hold off;
