local x = 0
local y = 0 
local z = 0
local position = vector.new(x, y, z) -- current vector initilization

local cx = 0
local cy = 0
local cz = 0
local home = vector.new(cx, cy, cz) -- home vector initilization

local ex = 0
local ey = 0
local ez = 0
local dest = vector.new(ex, ey, ez) -- destination vector initilization


local square = 0 -- size of mine area

local notItems = {
    "minecraft:dirt",
    "minecraft:grass_block",
    "minecraft:stone",
    "minecraft:gravel",
    "minecraft:chest",
    "minecraft:flowing_lava"
      }

function findme()
    local tx, ty, tz = gps.locate(5)
    if not tx then
        print("Lost Signal")
        x = ex
        print("reset mode")
    else
        x, y, z = gps.locate(5)
    end        
    print("I am at (" .. x .. ", " .. y .. ", " .. z .. ")")
    
    position = vector.new(x, y, z)

    local tohome = position - home
    local todest = dest - position

    print("I am ", tostring(tohome), " away from home!")
    print("I am ", tostring(todest), " away from end!")
end

function sethome()
    cx, cy, cz = gps.locate(5)

    home = vector.new(cx, cy, cz)
end

function setendvec()
   ex = cx + square
   ey = 3
   ez = cz + square

   dest = vector.new(ex, ey, ez)
end
      
  function compDown()
    print("look down")
  local succes, data = turtle.inspectDown()
   if succes then
    if data.name == notItems[1] then
      elseif data.name == notItems[2] then
        elseif data.name == notItems[3] then  
          elseif data.name == notItems[4] then
              elseif data.name == notItems[5] then
                for i = 1, 27 do
                  turtle.suckDown()
                end
                turtle.digDown()
                elseif data.name == notItems[6] then
                    turtle.select(16)
                    turtle.placeDown()
                else
                turtle.digDown()      
        end
     end
  end
   
  function compUp()
    print("look up")
    local succes, data = turtle.inspectDown()
    if succes then
     if data.name == notItems[1] then
       elseif data.name == notItems[2] then
         elseif data.name == notItems[3] then  
           elseif data.name == notItems[4] then
               elseif data.name == notItems[5] then
                 for i = 1, 27 do
                   turtle.suckDown()
                 end
                 turtle.digDown()
                 elseif data.name == notItems[6] then
                     turtle.select(16)
                     turtle.placeDown()
                 else
                 turtle.digDown()   
         end
      end
   end
   
  function comp()
    print("look forward")
    local succes, data = turtle.inspectDown()
    if succes then
     if data.name == notItems[1] then
       elseif data.name == notItems[2] then
         elseif data.name == notItems[3] then  
           elseif data.name == notItems[4] then
               elseif data.name == notItems[5] then
                 for i = 1, 27 do
                   turtle.suckDown()
                 end
                 turtle.digDown()
                 elseif data.name == notItems[6] then
                     turtle.select(16)
                     turtle.placeDown()
                 else
                 turtle.digDown()     
         end
      end
   end
   
  function compLeft()
    print("look left")
    turtle.turnLeft()
    local succes, data = turtle.inspectDown()
    if succes then
     if data.name == notItems[1] then
       elseif data.name == notItems[2] then
         elseif data.name == notItems[3] then  
           elseif data.name == notItems[4] then
               elseif data.name == notItems[5] then
                 for i = 1, 27 do
                   turtle.suckDown()
                 end
                 turtle.digDown()
                 elseif data.name == notItems[6] then
                    turtle.select(16)
                    turtle.placeDown()
                 else
                 turtle.digDown()      
         end
      end
   end
   
  function compRight()
    print("look right")
    turtle.turnRight()
    local succes, data = turtle.inspectDown()
    if succes then
     if data.name == notItems[1] then
       elseif data.name == notItems[2] then
         elseif data.name == notItems[3] then  
           elseif data.name == notItems[4] then
               elseif data.name == notItems[5] then
                 for i = 1, 27 do
                   turtle.suckDown()
                 end
                 turtle.digDown()
                 elseif data.name == notItems[6] then
                    turtle.select(16)
                    turtle.placeDown()
                 else
                 turtle.digDown()      
         end
      end
   end

  function fuel()
    write("check fuel ")
    print(turtle.getFuelLevel())
    if turtle.getFuelLevel() < 50 then
        while turtle.getFuelLevel() < 50 do
            local number = 1
            for i = 1, 16 do
                turtle.select(number)
                turtle.refuel(2)
                number = number+1
            end
        end

        write("new fuel level ")
        print(turtle.getFuelLevel())
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
    if y ~= cy then
      turtle.turnLeft()
      comp()
      turtle.turnLeft()
      comp()
      turtle.turnLeft()
      comp()
      turtle.turnLeft()
    end
    fuel()  
  end

  function moveforward()
    print("forward")
    compare()
    turtle.dig()
    if turtle.forward() then
        findme()
    end
  end

  function moveBack()
    print("back")
    if turtle.back() then
        findme()
    end
  end

  function moveup()
    print("up")
    if turtle.up() then
        findme()
    end
  end

  function movedown()
    print("down")
    compare()
    turtle.digDown()
    if turtle.down() then
        findme()
    end
  end

  function moveRight()
    print("right")
    turtle.turnRight()
    compare()
    turtle.dig()
    if turtle.forward() then
        findme()
    end
    turtle.turnLeft()
    compare()
  end

  function moveLeft()
    print("left")
    turtle.turnLeft()
    turtle.dig()
    if turtle.forward() then
        findme()
    end
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
    while y ~= cy do
        if y < cy then
            moveup()
        end
        if y > cy then
            movedown()
        end
    end
  end

  function returnto()
    print("return to base")
    local ty = y
    local tx = x
    local tz = z
    if y ~= cy then
        while y < cy do
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
        while y > ty do
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
    while x < ex do
        ycycle()
        if x <= ex then
            for i = 1, 2 do
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
    while z < ez do
        xcycle()
        if z <= ez then
            for i = 1, 2 do
                moveRight()
            end
        end
    end
    while z > cz do
        moveLeft()
    end
  end

function mineForward(num)

    sethome()
    setendvec()
    findme()    

    print("GO!")

    zcycle()

    print("Stop!")
end

print("Size?")
    square = tonumber(read())

mineForward(square)
