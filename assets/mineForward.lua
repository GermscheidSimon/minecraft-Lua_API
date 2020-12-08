local y = 0 -- updown
local x = 0 -- forward
local z = 0 -- side-side

local square = 0 -- size of mine area

local notItems = {
    "minecraft:dirt",
    "minecraft:stone",
    "minecraft:gravel",
    "minecraft:chest",
    "minecraft:flowing_lava"
      } 
   
  function compDown()
  local succes, data = turtle.inspectDown()
   if succes then
    if data.name == notItems[1] then
      elseif data.name == notItems[2] then
        elseif data.name == notItems[3] then  
          elseif data.name == notItems[4] then
            for i = 1, 27 do
              turtle.suckDown()
            end
            turtle.digDown()
              elseif data.name == notItems[5] then
                turtle.select(15)
                turtle.placeDown()
              else
            turtle.digDown()      
        end
     end
  end
   
  function compUp()
  local succes, data = turtle.inspectUp()
    if succes then
      if data.name == notItems[1] then
        elseif data.name == notItems[2] then
          elseif data.name == notItems[3] then
            elseif data.name == notItems[4] then
              for i = 1, 27 do
                turtle.suckUp()
              end
              turtle.digUp()
              elseif data.name== notItems[5] then
                turtle.select(15)
                turtle.placeUp()
            else
            turtle.digUp()     
         end    
      end
  end

  function fuel()
    if turtle.getFuelLevel() < 50 then
      turtle.refuel()
    end
  end
   
  function compare()
    compDown()
    compUp()
    fuel()  
  end

function mineForward(num)
    
    while y <= num do
    
        write(y)
    
        local n = 0
    
        while n <= num do

            write (n)
        
            local i = 0
        
            while i <= num do
                compare() 
                turtle.dig()
                turtle.forward()
                i = i + 1
            end
            compare()
            turtle.digUp()
            turtle.up()
            turtle.turnRight()
            turtle.turnRight()

            i = 0

            while i <= num do 
                compare()
                turtle.dig()
                turtle.forward()
                i = i + 1
            end

            compare()
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

        if y ~= 0 then
            for i = 1, y do
            turtle.up()
            end
        end

        local number = 1
        for i = 1, 14 do
            turtle.select(number)
            turtle.drop()
            number = number+1
        end
    
        turtle.turnLeft()
        turtle.turnLeft()

        if y ~= 0 then
            for i = 1, y do
            turtle.down()
            end
        end
        compare()
        turtle.digDown()
        turtle.down()

        y = y + 1
        
        fuel()
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
