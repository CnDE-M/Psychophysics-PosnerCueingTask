# Posner Cueing Task

The project is to briefly reproduce "Posner cueing task" based on study of Posner (1980)<sup>[1]</sup>. Results are collected from 1 subject (author) and response time are analyzed under several conditions. The goal is to check if the same conclusion could be reproduced.

## Introduction

Posner Cueing Task, also known as "Ponser Paradigm, is a neuropsychological test used to assess spacial-based attention. The task result indicates that one could covertly shift one's attention with gaze fixed, and stimulus within the attention shifted region could be recollected more efficiently.

Task process goes like this:
	Subjects are required to fix the gaze at the center (with a fixation point) on the screen. A cue is displayed at either right or left side of screen in a brief interval. Then a target stimulus is displayed either in the region of the cue or not. Subject then response once they detect the target stimulus.

+ Cues:
> Type:

	- endogenous cue: present in central vision field or even focus region, indicating right or left screen;
	
	- exogenous cue: present in periperal vision field, highlighting left or right region of the screen；

> Format:
	arrows, flashing shape, highlighting space or frame.

+ Valid/Invalid Cue:

	- valid cue: cue and target stimulus present at the same region;
	
	- Invalid cue: cue and target stimulus present at different region / opposite region.

In previous research, it is found that valid cue could substantially decrease response time to target stimulus, which indicates attention shift caused by space cue.

This project concerned conditions in:

+ validation of cue;
+ cue presenting interval length;
+ Invalid cue distance to target stimulus;
+ cue distance to focus: total, horizontal, vertical;

Response time will be recorded in each trial;

The following analysis concerns difference on:

+ (1) Cue validation: 
	 RTs<sub>Valid_cue</sub>" <=> RTs<sub>Invalid_cue</sub>" 

<div align=center>
	<img width="1300" height="300" src="https://github.com/CnDE-M/Psychophysics-PosnerCueingTask/blob/master/result_image/intro_cue_validation.png">
</div>

+ (2) Cue interval length:
	"Valid cue": RTs <sub>Long_cue</sub> <=> RTs <sub>Short_cue</sub>;
	"Invalid cue": RTs <sub>Long_cue</sub> <=> RTs <sub>Short_cue</sub>;

+ (3) Invalid cue distance to target stimulus:
	  Polar distance
	  RTs <=> θ & | d<sub>cue</sub> - d<sub>target</sub> |;

<div align=center>
	<img width="500" height="351" src="https://github.com/CnDE-M/Psychophysics-PosnerCueingTask/blob/master/result_image/intro_cue_target_distance.png">
</div>

+ (4) Cue distance to focus:
      Euclidean distance
      RTs<sub>invalid</sub> - RTs<sub>valid</sub> <=> d<sub>cue</sub>

## Design

1. Screen Display

The screen is divided into 6×6 grid. A red cross is at the screen center for focus fixation. Cue is be a blue square at one of the grid, target stimulus is a blue dot at the center of the square.

For each condition:
+ validation of cue;
	- valid cue: target stimulus present at the center of cue square center;
	- Invalid cue: target stimulus present at the center of other square center;
+ cue presenting interval length;
	- 100 ms;
	- 300 ms;
+ cue distance to target stimulus;
	In an invalid cue trial, stimulus present either at the same side of cue or not;
+ cue distance to focus: 
	- total distance: euclidean distance;
	- horizontal distance;
	- vertical distance;

	Here shows an screen display example (green grid will not shown in formal experiment)

<div align=center>
	<img width="525" height="378" src="https://github.com/CnDE-M/Psychophysics-PosnerCueingTask/blob/master/result_image/intro_screen_display.png">
</div>


2. Experiment Process (according to 4 questions to be solved):

	 <p align="center" ><font color=grey>RTs<sub>Valid_cue</sub>" <=> RTs<sub>Invalid_cue</sub></font></p> 
	 + Condition number:
	   - Cue must be present in all grid 4 times for each (144 trial in total);
	   For Invalid cue, target stimulus present 2 times at the same side, 2 times at the other side, and the specific coordinate is randomly generated.
	   - valid cue (144); invalid cue(144);
	   - display in random sequence;
	   
	 + Cue Intervals: 100 ms; 300 ms

Total trial numbers: 
	36 grids × 4 repetition × 2(valid or not) × 2 (internals) = 576. 


3. Subject and Response Collection:

Subjects are required to response as quick as possible once target stimulus is detected.

Experiment will collect:
(1) Cue Internals
(2) Cue validation
(3) Same side or not
(4) Cue coordinate
(5) Dot coordinate
(6) Response time
And recorded in excel for further analysis

## Result

1. Design Change based on subject's report
	One subject(the author) conducts the experiments for 3 times, with some revision on design for each time

+ 1<sup>st</sup> Round

<p align="center">*Target Size: 20; cue intervals [0.5, 1]; fixation cross size: 1;*</p>
	
Report:

+ Fixation size is too big for focus stay
+ Cue interval time is too short for attention stable after shifting to cue;
+ Target dot size is too big that makes it so distinguishable;
+ After presenting the cue, subjects should deliberately shift their attention to the cue square area, as if they are expecting the target presenting within the cue region;

+ 2<sup>en</sup> Round

<p align="center">*Target Size: **10**; cue intervals **[0.8, 1.2]**; fixation cross size: **0.5**;*</p>
	
Report:
+ The sudden disappearance of cue will alert subject that target is present, and they will unconsciouly press the key after they detecting target.

In the next round, cue will continue showing after target appear;

+ In the first 2 rounds, subject need to press key every time a trial start.

In the next round, subject don't need to press a key to start each trial, instead cue will continue shifting its position. For subject to prepare before each trial, the cue interval will all extend 1s.

+ 3<sup>rd</sup> Round

	<p align="center">*Target Size: 10; cue intervals [0.8, 1.2]+**1**; fixation cross size: 0.5;*</p>
	**Cue will continue showing after target appear**;
	**Trials keep processing with cue square shifting position**;
	For every 50 trials, experiment will pause so subject could rest and refresh.
	
Report:

+ To improve attention shifting to cue square effectivity, subjects could keep expecting to see stimulus at the center of cue square, this trick is helpful, because with the cue presenting in the screen, subject's attention could still wandering around the screen without couscious control.
+ The fixation could still be smaller, like useing a dot instead of a cross
+ When performing, subjects shouldn't have other thought in mind which will disturb one's attention.

2. Statistical analysis 
	3 rounds' dataset is analysed separately and displayed one by one.

a) Cue Validation ~ RTs

<div align=center>
	<img width="1800" height="300" src="https://github.com/CnDE-M/Psychophysics-PosnerCueingTask/blob/master/result_image/validation_2.png">
</div>


b) Cue Intenal Length ~ RTs

<div align=center>
	<img width="1800" height="300" src="https://github.com/CnDE-M/Psychophysics-PosnerCueingTask/blob/master/result_image/cue_time.png">
</div>


c) Cue distance to target:

<div align=center>
	<img width="1800" height="300" src="https://github.com/CnDE-M/Psychophysics-PosnerCueingTask/blob/master/result_image/cue_target_distance.png">
</div>


d) Cue distance to focus:


<div align=center>
	<img width="1800" height="300" src="https://github.com/CnDE-M/Psychophysics-PosnerCueingTask/blob/master/result_image/cue_focus_distance_1.png">
</div>


<div align=center>
	<img width="1800" height="300" src="https://github.com/CnDE-M/Psychophysics-PosnerCueingTask/blob/master/result_image/cue_focus_distance_2.png">
</div>



## Discussion

1. Target stimulus should set not that distinctive, or difference on RT will be too small for program to detect. So the size or width should set small;

2. Cue interval time should be long enough for attention shift, around 500ms to 1s.

3. For acurrate result, gaze need to be tracked to make sure subject focus properly.

4. The hardware screen used to perform this experiment should be clean and without any disturbing stuff, like dust or light reflection.

## Reference

[1] Posner, M. I. (1980). "Orienting of attention". Quarterly Journal of Experimental Psychology.

[2] Wallisch P, Lusignan M E, Benayoun M D, et al. MATLAB for neuroscientists: an introduction to scientific computing in MATLAB[M]. Academic Press, 2014: 165-172.
