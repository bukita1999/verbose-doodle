function map2Ddrawing()
    try
        ros_connect('192.168.191.30')
    catch 
        disp('already connected')
    end
    
    timer_id = timer('TimerFcn',@mapUpdate_fcn,'Period',1,'ExecutionMode','fixedSpacing','TasksToExecute',inf)
    start(timer_id);
    input('waiting for stop command:')
    stop(timer_id);
    close all;
end

function ros_connect(input)
%myFun - Description
%
% Syntaxn connnect = myFun(input)
%
    input
    rosinit(input)
end

function mapUpdate_fcn(~,~)
    sub = rossubscriber('/map');
    msg = receive(sub,10);
    map = readOccupancyGrid(msg);
    show(map)
end