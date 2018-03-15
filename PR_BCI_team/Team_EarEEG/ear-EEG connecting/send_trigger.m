clear all; clc;

%% ���α׷� ����
%   openvibe acquisition sever
%       Driver: mBrainTrain Smarting
%       Driver Properties
%           number of channels: 24
%           port number: 5
%           sampling frequency: 500
%           change channel name -> load -> ������\ear_chan_name.csv
%
%       Preferences
%           Select only named channels: check
%           enable External Stimulation: check
%           LSL_EnableSLOutput: check
%
%       connect -> play
%       => ���� �Ϸ�
%
%   openvibe designer
%       ����- ���ϸ�:design2_TCP.mxs
%       ���
%       => ����, display, matlab ����
%
%% matlab setting
%   ����߰�
%       matlab-openvibe ���
%           external\liblsl-Matlab
%       openvibe���� online data �޾ƿ���
%           external\eeglab_10_0_1_0x
%       EEG plot�ϱ�, brain vision���� online data ��������
%           C:\Users\cvpr\Documents\OpenBMI-master

%% send trigger
% brain vision setting
global IO_LIB IO_ADD;
IO_LIB=which('inpoutx64.dll');
IO_ADD=hex2dec('E010');

% openviber setting
t = tcpclient('localhost', 15361);
padding=uint64(0);
timestamp=uint64(0);
stimulus1=[padding; uint64(1); timestamp];
stimulus2=[padding; uint64(2); timestamp];
stimulus3=[padding; uint64(3); timestamp];

% send trigger
while true
    write(t, stimulus1);
    ppWrite(IO_ADD, 1);
    pause(1);
    
    write(t, stimulus2);
    ppWrite(IO_ADD, 2);
    pause(1);
    
    write(t, stimulus3);
    ppWrite(IO_ADD, 3);
    pause(1);
end
