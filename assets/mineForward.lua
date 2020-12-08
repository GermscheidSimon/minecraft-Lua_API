local y = 0 -- updown
local x = 0 -- forward
local z = 0 -- side-side

local square = 0 -- size of mine area


function mineForward(num)
    
    local n = 0
    
    while n <= num do

        write (n)
        
        turtle.refuel()
        
        local i = 0
        
        while i <= num do 
            turtle.dig()
            turtle.forward()
            turtle.dig()
            i = i + 1
        end
        turtle.digUp()
        turtle.up()
        turtle.turnRight()
        turtle.turnRight()

        i = 0

        while i <= num do 
            turtle.dig()
            turtle.forward()
            turtle.dig()
            i = i + 1
        end

        turtle.down()
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft() 

        n = n + 1   
    end

    write("Returning home!")

    n = 0

    turtle.turnLeft()

    while n <= num do
        write(n)

        turtle.forward()

        n = n + 1
    end

    turtle.turnLeft()

    local number = 1
    for i = 1, 14 do
        turtle.select(number)
        turtle.drop()
        number = number+1
    end

end


print("Size?")
    square = tonumber(read())

mineForward(square)


function findStart()
    local isAtStart = false
    while isatStart do

        turtle.digDown()
        turtle.down()
    end
end

function canMove(direction)
    local CanmoveInDirection
    if direction == "up" then
        canmoveInDirection = turtle.up()
end

end
