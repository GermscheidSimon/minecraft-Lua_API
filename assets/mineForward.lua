local y = 0 -- updown
local x = 0 -- forward
local z = 0 -- side-side


function mineForward(num)
    turtle.refuel()
    local i = 0
    while i <= num do 
        turtle.dig()
        turtle.forward()
        turtle.dig()
        print(i)
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
        print(i)
        i = i + 1
end



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

mineForward(20)


