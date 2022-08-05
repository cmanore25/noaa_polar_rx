%% Turnstile antenna design
% Author: Curtis Manore
% NOAA Satellite, 137.5 MHz center frequency
% adapted from Mathworks documentation:
% https://www.mathworks.com/help/antenna/ug/crossed-dipole-turnstile-antenna-and-array.html

close all; clear all;

% turnstile antenna params
freq    = 137.5e6; % center design frequency
lambda  = 3e8/freq;
offset  = lambda/50;
spacing = lambda/2;
length  = lambda/2.1;
width   = lambda/50;
anglevar= 0:10:180;
freqrange = 80e6:1e6:180e6;
gndspacing = lambda/4;

% create turnstile antenna
d  = dipole('Length',length,'Width',width);
ant= dipoleCrossed('Element',d,'Tilt',90,'TiltAxis',[0 1 0]);
figure(1); show(ant);

% return loss figure
figure(2);
returnLoss(ant, freqrange, 75); 
% should impedance matching go from 75 to 50?
% update: lower return loss with 50 ohm match, stick to 75

% radiation patern
figure(3)
pattern(ant, freq);

% put in normal mode?

% pattern elevation
figure(4)
patternElevation(ant, freq);