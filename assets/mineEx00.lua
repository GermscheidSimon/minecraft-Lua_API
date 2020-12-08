local turns = 0
local size = 0
local layers = 0
local y = 0
local place = 0
local eNeeded = 0
local home = 0
 
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
 
function compare()
  compDown()
  compUp()  
end
 
function moveForward()
local succes, data = turtle.inspect()
  while not turtle.forward() do
    if succes then
      if data.name == notItems[4] then
        for i = 1, 27 do
          turtle.suck()
        end
        turtle.dig()
        else  
          turtle.dig()
       end
    end  
  end
end
 
function moveDown()
  while not turtle.down() do
    turtle.digDown()
  end
 y = y-1
end
 
function moveUp()
  while not turtle.up() do
    turtle.digUp()
  end
 y = y+1
end

function currentstate()
  local cturns = turns
  local clayers = layers
  local cy = y
  local cplace = place
  local csize = size
end
 
function goHome()
  currentstate()
  if layers == 1 and place == 0 then
  else
    repeat
      moveUp()
    until y == home
  end
  if layers == 0 then
    if size == 1 then
      if turns == 0 then
        for i = 1, 2 do
          turtle.turnLeft()
          for i = 1, size-1 do
            moveForward()
          end
        end
      end
    else
      if turns == 1 then
        turtle.turnRight()
        for i = 1, size-1 do
          moveForward()
        end
      end
    end
  elseif layers == 1 then
    if size == 1 then
      for i = 1, 2 do
        turtle.turnLeft()
        for i = 1, size-1 do
          moveForward()
        end    
      end
    else
      turtle.turnRight()
      for i = 1, size-1 do
        moveForward()
      end 
    end
  else 
    turtle.turnLeft()
  end
end

function returnto()
  if layers == clayers and place == cplace then
  else
    repeat
      movedown()
    until y == cy
  end
  if layers == clayers then
    if size == csize then
      if turns == cturns then
        for i = 1, 2 do
          turtle.turnRight()
          for i = 1, csize-1 do
            moveForward()
          end
        end
      end
    else
      if turns == cturns then
        turtle.turnLeft()
        for i = 1, csize-1 do
          moveForward()
        end
      end
    end
  elseif layers == clayers then
    if size == csize then
      for i = 1, 2 do
        turtle.turnRight()
        for i = 1, csize-1 do
          moveForward()
        end    
      end
    else
      turtle.turnRight()
      for i = 1, csize-1 do
        moveForward()
      end 
    end
  else 
    turtle.turnRight()
  end
end
 
function fuel()
  turtle.select(1)
  if turtle.getFuelLevel() < 50 then
    turtle.refuel()
  end
end
 
function dropItems()
  goHome()
  local number = 2
  for i = 1, 14 do
    turtle.select(number)
    turtle.drop()
    number = number+1
  end
  returnto()
end
 
function checkItems()
  if turtle.getItemDetail(11) == false then
  else
    dropItems()
  end
end
 
function dig()
  fuel()  
  compare()  
  for i = 1, size-1 do
    moveForward()
    compare()
  end
end
 
function turnright()
  turtle.turnRight()
  moveForward()
  turtle.turnRight()
end
 
function turnleft()
  turtle.turnLeft()
  moveForward()
  turtle.turnLeft()
end
 
function nextLayer()
  moveDown()
  turtle.turnRight()
  turtle.turnRight()
end
 
function square()
local count = 1
  for i = 1, size do
    dig()
    if count ~= size then 
      if turns == 0 then
        turnright()
        turns = 1
      else
        turnleft()
        turns = 0
      end
      count = count+1
    end
  end
  if turns == 0 then
    checkItems()
  end
end
 
function Layers()
  square()
  if layers > 1 then
    for i = 1, layers-1 do
      nextLayer()
      square()
    end
  end
end
 
function Bedrock()
  square()
  repeat 
    if y == 3 then
      moveDown()
      turtle.turnRight()
      turtle.turnRight()
      square()
    else
      nextLayer()
      square()
    end
  until y < 3
end  
 
function getInPlace()
  if place == 1 then
    moveDown()
  elseif place == 0 then
    moveForward()
  else 
    print("Place must be 1 or 0")
    print("Please try again")
    sleep(3)
    os.reboot()
  end
end
 
function calcEnergy()
  if layers == 0 then
    eNeeded = ((size*size*(y/3))+50)
  else
    eNeeded = ((size*size*layers)+50) 
  end
end
 
print("Please put first coal in slot 1...") 
print("some filling blocks in slot 16...")
print("And don't forget to chunkload the area.")
os.pullEvent()
 
write("What is the YLevel: ")
y = tonumber(read())
 
write("What home level do you want: ")
home = tonumber(read())
 
print("Are you above or under ground?")
write("Type 1 for above and 0 for under: ")
place = tonumber(read())
 
write("What size do you want: ")
size = tonumber(read())
 
print("How many layers do you want?")
write("Or type 0 to go to bedrock: ")
layers = tonumber(read())
 
print(y)
calcEnergy()
repeat 
  if eNeeded < turtle.getFuelLevel() then
  else
    turtle.refuel()
    print("Please put more coal in slot 1")
    os.pullEvent()
  end
until eNeeded < turtle.getFuelLevel() 
  
getInPlace()
term.clear()
term.setCursorPos(1, 1)
print("Digging")
  
if layers == 0 then
  Bedrock()
  else
  Layers()
end
 
print("Done!!!")
goHome()
local number = 2
for i = 1, 14 do
  turtle.select(number)
  turtle.drop()
  number = number+1
end