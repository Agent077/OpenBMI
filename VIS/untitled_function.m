function [averagedSMT, rvaluedSMT] = untitled_function(SMT, opt)
%% Description
% option�� ���� SMT ������ִ� function

%% main
if ~isstruct(opt)
    opt = opt_cellTostruct(opt);
end
if ~isfield(opt, 'MIPlot') opt.MIPlot = 'off'; end
if ~isfield(opt, 'rValue') opt.rValue = false; end
if ~isfield(opt, 'baseline') opt.baseline = []; end

if isequal(opt.MIPlot, 'on')
    SMT = prep_envelope(SMT);
end
if ~isempty(opt.baseline)
    SMT = prep_baseline(SMT, {'Time', opt.baseline});
end

SMT = prep_selectClass(SMT, {'class', opt.Class});

averagedSMT = prep_average(SMT);

if nargout == 2
    if isequal(opt.rValue, 'on')
        rvaluedSMT = proc_rSquareSigned(SMT);
    else
        rvaluedSMT = [];
    end
end