clear;
clc;
clf;
hold on
direction = [0 0 1];
rectangle('Position',[-0.05 -0.05 0.1 0.1],'Curvature',[1 1],'EdgeColor','k','FaceColor','k');
for i = 1:5
    q = plot(cos(0:0.01:2*pi),rand*sin(0:0.01:2*pi));
    axis([-1.5 1.5 -1.5 1.5])
    rotato = randi(180);
    rotate(q,direction,rotato)
end
for i = 1:5
    q = plot(2*cos(0:0.01:2*pi),2*rand*sin(0:0.01:2*pi));
    axis([-1.5 1.5 -1.5 1.5])
    rotato = randi(180);
    rotate(q,direction,rotato)
end
axis([-2.5 2.5 -2.5 2.5])
hold off