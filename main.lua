Grid = require('grid')
Shape = require('pieces')

function love.load()
    love.graphics.setBackgroundColor(0, 0.5, 0.3)
    grid = Grid:init()
    shape = Shape:init()
    --grid:lay(shape)
end 

function love.draw()
    if shape.out == false then 
        shape:draw()
    end 
    grid:draw()
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end 
    if key == 'a' or key == 'left' then 
        shape.x = shape.x - 1
    elseif key == 'd' or key == 'right' then
        shape.x = shape.x + 1
    end 
end 

function love.update(dt)
    if shape.out then 
        grid:lay(shape)
        shape = Shape:init()
    else 
        shape:move(dt)
    end 
    grid:erase()
end 