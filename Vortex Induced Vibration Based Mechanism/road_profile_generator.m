t = outputTime(:,2);
y = RoadProfileTS(:,2);
dt = t(2) - t(1);

for i = 2:13333
    y_dot(i) = (y(i) - y(i-1))/dt;
end
rp = timeseries(y, outputTime(:,2));
rp_dot = timeseries(y_dot, outputTime(:,2));