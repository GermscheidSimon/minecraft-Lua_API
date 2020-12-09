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
    print("look down")
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
    print("look up")
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
    print("look forward")
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
   
  function compLeft()
    print("look left")
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
    print("look right")
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

  function fuel()
    write("check fuel")
    print(turtle.getFuelLevel())
    if turtle.getFuelLevel() < 50 then
      turtle.refuel()
    end
  end

  function dropitems()
    print("drop items")
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
    if y ~= 0 then
      turtle.turnLeft()
      turtle.turnLeft()
      comp()
      turtle.turnLeft()
      turtle.turnLeft()
      compLeft()
      compRight()
    end
    fuel()  
  end

  function moveforward()
    print("forward")
    compare()
    turtle.dig()
    turtle.forward()
    x = x + 1
  end

  function moveBack()
    print("back")
    turtle.back()
    x = x - 1
  end

  function moveup()
    print("up")
    turtle.up()
    y = y - 1
  end

  function movedown()
    print("down")
    compare()
    turtle.digDown()
    turtle.down()
    y = y + 1
  end

  function moveRight()
    print("right")
    turtle.turnRight()
    compare()
    turtle.dig()
    turtle.forward()
    z = z + 1
    turtle.turnLeft()
    compare()
  end

  function moveLeft()
    print("left")
    turtle.turnLeft()
    turtle.dig()
    turtle.forward()
    z = z - 1
    turtle.turnRight()
  end

  function coresample()
    print("going down")
    for i = 1, square do 
        movedown()
    end
    for i = 1, square do 
        moveup()
    end
  end

  function returnto()
    print("return to base")
    local ty = y
    local tx = x
    local tz = z
    if y ~= cy then
        while y > cy do
            moveup()
        end
    end
    if x ~= cx then
        while x > cx do
            moveBack()
        end
    end
    if z ~= cz then
        while z > cz do
            moveLeft()
        end
    end

    dropitems()

    print("resume mission")
     
    if z ~= tz then
        while z < tz do
            moveRight()
        end
    end
    if x ~= tx then
        while x < tx do
            moveforward()
        end
    end
    if y ~= ty then
        while y < ty do
            movedown()
        end
    end
  end

  function checkItems()
    if turtle.getItemDetail(14) == false then
    else
      print("inventory full")
      returnto()
    end
  end

  function ycycle()
    print("begin y")
    print(y) 
    coresample()
    checkItems()
  end

  function xcycle()
    print("begin x")
    print(x)  
    while x <= square do
        ycycle()
        if x <= square then
            for i = 1, 3 do
                moveforward()
            end
        end
    end
    while x > cx do
        moveBack()
    end
  end

  function zcycle()
    print("begin z")
    print(z)
    while z <= square do
        xcycle()
        if z <= square then
            for i = 1, 3 do
                moveRight()
            end
        end
    end
    while z > cz do
        moveLeft()
    end
  end

function mineForward(num)

    print("GO!")

    zcycle()

    print("Stop!")
end

print("Size?")
    square = tonumber(read())

mineForward(square)
