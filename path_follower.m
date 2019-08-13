clc
clear
close

%creating a 11x11 black and white arena
N = 11;
colors = [1 1 1; 0 0 0];
inds = 1:N^2;
color_inds = 1+mod(inds,2);
r = colors(color_inds,1);
g = colors(color_inds,2);
b = colors(color_inds,3);
arena = cat(2,r,g,b);
arena = reshape(arena,[N,N,3]);
imagesc(arena);
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'ytick',[])
set(gca,'yticklabel',[])
axis equal tight;

% making walls on the image according to the given design

bl = [3,3;4,3;5,3;6,3;7,3;8,3;
    9,3;10,3;4,6;4,7;4,8;4,9;
    4,10;4,11;8,8;9,8;10,8;8:9;8,10];

temp = size(bl,1);
for i=1:temp
    arena(bl(i,1),bl(i,2),1) = 0;
    arena(bl(i,1),bl(i,2),2) = 0;
    arena(bl(i,1),bl(i,2),3) = 1;
end

% Initial position and Destination
curr_pos = [6,6];
arena(curr_pos(1),curr_pos(2),1) = 0;
arena(curr_pos(1),curr_pos(2),2) = 1;
arena(curr_pos(1),curr_pos(2),3) = 1;

dest = [2,9];
arena(dest(1),dest(2),1) = 0;
arena(dest(1),dest(2),2) = 1;
arena(dest(1),dest(2),3) = 0;

imagesc(arena);
set(gca,'xtick',[])
set(gca,'xticklabel',[])
set(gca,'ytick',[])
set(gca,'yticklabel',[])
axis equal tight;

disp('The possible direction are UP-1, DOWN-2, RIGHT-3, LEFT-4');
disp('Please enter 1 or 2 or 3 or 4, when asked for user input for movement')

while ~(curr_pos(1)==dest(1) & curr_pos(2)==dest(2))
    prev_pos = curr_pos;
    ip = 'Where would you like to move now?';
    x = input(ip);
    no_move = 0;
    
    switch x
        case 1
            disp('You chose to move UP');
            next_pos = curr_pos + [-1,0];
            wall = hitsWall(bl,next_pos);
            if next_pos(1)<0 | wall
                disp("Can't move that way!");
                no_move = 1;
            else
                curr_pos = next_pos;
            end
            
            
        case 2
            disp('You chose to move DOWN');
            next_pos = curr_pos + [1,0];
            wall = hitsWall(bl,next_pos);
            if next_pos(1)>11 | wall
                disp("Can't move that way!");
                no_move = 1;
            else
                curr_pos = next_pos;
            end
            
            
        case 3
            disp('You chose to move RIGHT');
            next_pos = curr_pos + [0,1];
            wall = hitsWall(bl,next_pos);
            ismember(next_pos,bl);
            if next_pos(1)>11 | wall
                disp("Can't move that way!");
                no_move = 1;
            else
                curr_pos = next_pos;
            end
            
            
        case 4
            disp('You chose to move LEFT');
            next_pos = curr_pos + [0,-1];
            wall = hitsWall(bl,next_pos);
            if next_pos(1)<0 | wall
                disp("Can't move that way!");
                no_move = 1;
            else
                curr_pos = next_pos;
            end
        otherwise
            disp('Please enter valid input!');
    end
    
    isLight = mod(prev_pos(1),2) + mod(prev_pos(2),2);
    if isLight~=1
        arena(prev_pos(1),prev_pos(2),1) = 0;
        arena(prev_pos(1),prev_pos(2),2) = 0;
        arena(prev_pos(1),prev_pos(2),3) = 0;
    else
        arena(prev_pos(1),prev_pos(2),1) = 1;
        arena(prev_pos(1),prev_pos(2),2) = 1;
        arena(prev_pos(1),prev_pos(2),3) = 1;
    end
    if(no_move~=1)
        arena(curr_pos(1),curr_pos(2),1) = 0;
        arena(curr_pos(1),curr_pos(2),2) = 1;
        arena(curr_pos(1),curr_pos(2),3) = 1;
    else
        arena(prev_pos(1),prev_pos(2),1) = 0;
        arena(prev_pos(1),prev_pos(2),2) = 1;
        arena(prev_pos(1),prev_pos(2),3) = 1;
    end
    
    
    imagesc(arena);
    set(gca,'xtick',[])
    set(gca,'xticklabel',[])
    set(gca,'ytick',[])
    set(gca,'yticklabel',[])
    axis equal tight;
end

disp("Success! You have reached your destination")


