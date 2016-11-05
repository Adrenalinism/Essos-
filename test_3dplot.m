
x = 1:3;
y = 1:3;
z = [2 3 4; 2 3 2; 3 2 4]; % is height in surf()
test = surf(x,y,z); %draw surf
zlim([-5 10]); % set z limits
set(test,'FaceColor',[1 0 0]); % set fixed plane color

F(1) = getframe; % store current figure in F
set(test,'FaceColor',[1 1 0]); % change plane color
F(2) = getframe; % store new figure in F slot 2
movie(F,1,1); % play movie in matlab

movie2gif(F, 'plswork.gif', 'LoopCount', inf, 'DelayTime', 1) % make gif, inf loop, delay each frame by 1s

% x = 1:3;
% y = 1:3;
n1 = 
n2 = 
n3 = 
n4 = 
n5 = 
n6 = 
n7 = 
n8 = 
% 
% 
% 
% 
% z = [((n1+n2+n3+n4+n5+n6+n7+n8)/8) n1 n2; n3 n4 n5; n6 n7 n8];