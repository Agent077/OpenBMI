
% <<<step4>>> mat���� -> set���� ��ȯ�ϱ�
 
EEG = pop_importdata('dataformat', 'matlab', 'nbchan', 56, 'data', 'D:\anedata_step\d2_MM_1.mat', 'srate', 200, 'pnts', 0, 'xmin', 0);

EEG = pop_importevent(EEG, 'event', 'D:\practice\MM_1_event.txt','fields', {'type' 'latency' 'duration'}, 'skipline', 1, 'timeunit', 1);
