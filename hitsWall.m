function res = hitsWall(bl, next_pos)

res=0;

for i=1:size(bl,1)
    if(bl(i,1)==next_pos(1) & bl(i,2)==next_pos(2))
        res = 1;
        break;
    end
end

end