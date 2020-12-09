local y = 0 -- updown
local x = 0 -- forward
local z = 0 -- side-side

local cy = 0 -- current y
local cx = 0 -- current x
local cz = 0 -- current z


local square = 0 -- size of mine area

local notItems = {
    "minecraft:dirt",
    "minecraft:stone",
    "minecraft:gravel",
    "minecraft:chest",
    "minecraft:flowing_lava",
    "minecraft:bedrock"
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
                turtle.select(16)
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
                turtle.select(16)
                turtle.placeUp()
            else
            turtle.digUp()     
         end    
      end
  end
   
  function comp()
  local succes, data = turtle.inspect()
    if succes then
      if data.name == notItems[1] then
        elseif data.name == notItems[2] then
          elseif data.name == notItems[3] then
            elseif data.name == notItems[4] then
              for i = 1, 27 do
                turtle.suck()
              end
              turtle.dig()
              elseif data.name== notItems[5] then
                turtle.select(16)
                turtle.place()
            else
            turtle.dig()     
         end    
      end
  end
   
  function compleft()
    turtle.turnLeft()
    local succes, data = turtle.inspect()
    if succes then
      if data.name == notItems[1] then
        elseif data.name == notItems[2] then
          elseif data.name == notItems[3] then
            elseif data.name == notItems[4] then
              for i = 1, 27 do
                turtle.suck()
              end
              turtle.dig()
              elseif data.name== notItems[5] then
                turtle.select(16)
                turtle.place()
            else
            turtle.dig()     
         end    
      end
    turtle.turnRight()
  end
   
  function compRight()
    turtle.turnRight()
    local succes, data = turtle.inspect()
    if succes then
      if data.name == notItems[1] then
        elseif data.name == notItems[2] then
          elseif data.name == notItems[3] then
            elseif data.name == notItems[4] then
              for i = 1, 27 do
                turtle.suck()
              end
              turtle.dig()
              elseif data.name== notItems[5] then
                turtle.select(16)
                turtle.place()
            else
            turtle.dig()     
         end    
      end
    turtle.turnLeft()
  end
   
  function compBack()
    turtle.turnLeft()
    turtle.turnLeft()
  local succes, data = turtle.inspect()
    if succes then
      if data.name == notItems[1] then
        elseif data.name == notItems[2] then
          elseif data.name == notItems[3] then
            elseif data.name == notItems[4] then
              for i = 1, 27 do
                turtle.suck()
              end
              turtle.dig()
              elseif data.name== notItems[5] then
                turtle.select(16)
                turtle.place()
            else
            turtle.dig()     
         end    
      end
    turtle.turnLeft()
    turtle.turnLeft()
  end

  function fuel()
    if turtle.getFuelLevel() < 50 then
      turtle.refuel()
    end
  end

  function dropitems()
    turtle.turnLeft()
    turtle.turnLeft()
    local number = 2
    for i = 1, 14 do
        turtle.select(number)
        turtle.drop()
        number = number+1
    end
    turtle.turnRight()
    turtle.turnRight()
  end
   
  function compare()
    compDown()
    compUp()
    comp()
    compLeft()
    compRight()
    compBack()
    fuel()  
  end

  function moveforward()
    compare()
    turtle.dig()
    turtle.forward()
    x = x + 1
  end

  function moveback()
    compare()
    turtle.back()
    x = x - 1
  end

  function moveright()
    turtle.turnRight()
    compare()
    turtle.dig()
    turtle.forward()
    z = z + 1
    turtle.turnLeft()
    compare()
  end

  function moveLeft()
    turtle.turnLeft()
    compare()
    turtle.dig()
    turtle.forward()
    z = z - 1
    turtle.turnRight()
    compare()
  end

  function coresample()
    for i = 1, square do 
        compare()
        turtle.digDown()
        turtle.down()

        y = y + 1
    end
    while y < cy do
        turtle.up()

        y = y - 1
    end
  end

  function returnto()

    local ty = y
    local tx = x
    local tz = z
    if y ~= cy then
        while y ~= cy do
            moveup()
        end
    end
    if x ~= cx then
        while x ~= cx do
            moveback()
        end
    end
    if z ~= cz then
        while z ~= cz do
            moveLeft()
        end
    end

    dropitems()
     
    if z ~= tz then
        while z ~= tz do
            moveRight()
        end
    end
    if x ~= tx then
        while x ~= tx do
            moveforward()
        end
    end
  end

  function checkItems()
    if turtle.getItemDetail(14) == false then
    else
      returnto()
    end
  end

  function ycycle()
    while y <= square do
        coresample()
        checkItems()
    end
  end

  function xcycle()  
    while x <= square do
        ycycle()
        if x <= square then
            for i = 0, 3 do
                moveforward()
            end
        end
    end
    while x > cx do
        moveback()
    end
  end

  function zcycle()

    while z <= square do
        xcycle()
        moveRight()
    end
    while z > cz do
        moveLeft()
    end
  end

function mineForward(num)

    zcycle()
    returnto()
    
end

print("Size?")
    square = tonumber(read())

mineForward(square)
