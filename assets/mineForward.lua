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
    turtle.digup()
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

mineForward(20)