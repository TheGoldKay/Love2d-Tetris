Grid = require('grid')
Shape = require('pieces')

function love.load()
    love.graphics.setBackgroundColor(0, 0.5, 0.3)
    grid = Grid:init()
    shape = Shape:init()
    --grid:lay(shape)
end 

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end 
end 

function love.draw()
    grid:draw()
    shape:draw()
end

function love.update(dt)
    shape:move(dt)
    if shape.out then 
        grid:lay(shape)
    end 
end 