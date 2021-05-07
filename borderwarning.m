function borderwarning()
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description
    ros_connect('http://192.168.191.30:11311')
    while 1
        x = input('What do you want to do? 0.scan else quit:')
        if x == 0
            scan_data_plot()
        else
            break
        end
    end
    rosshutdown 
end

function ros_connect(input)
%myFun - Description
%
% Syntaxn connnect = myFun(input)
%
    input
    rosinit(input)
end

function scan_data_plot()
    laser = rossubscriber('/scan')
    scandata = receive(laser,10)
    ranges = scandata.Ranges;
    for i=1:length(ranges)
       if ranges(i)<0.3
           ranges(i)
           disp('我撞到了啊啊啊啊啊啊啊啊')
           break
       end
    end      
end



