function ca
m=6;n=6;p=.5;h=1000;
for x=1:m
    for y=1:n
        r=rand(1);
        if r>p
            a(x,y)=1;
        else
            a(x,y)=0;
        end
    end
end
figure
for x=1:m
    for y=1:n
        if a(x,y)==1
            fx=[x-1,x-1,x,x];
            fy=[y-1,y,y,y-1];
            fill(fx,fy,'g'),hold on
        else
        end
    end
end

for k=1:h
    fx=[0,m,m,0];fy=[0,0,n,n];fill(fx,fy,'k'),hold on
    for x=2:m-1
        for y=2:n-1
            b(x,y)=a(x-1,y-1)+a(x-1,y)+a(x-1,y+1)+a(x,y-1)+a(x,y+1)+a(x+1,y-1)+a(x+1,y)+a(x+1,y+1);
            if b(x,y)==2
                c(x,y)=a(x,y);
            elseif b(x,y)==3
                c(x,y)=1;
            else
                c(x,y)=0;
            end
        end
    end
    c(1:m,1)=a(1:m,1);
    c(1:m,n)=a(1:m,n);
    for x=1:m
        for y=1:n
            if c(x,y)==1
                fx=[x-1,x-1,x,x];
                fy=[y-1,y,y,y-1];
                fill(fx,fy,'g'),
                hold on
            else
            end
        end
    end
    pause(.05)
    a=c;
end