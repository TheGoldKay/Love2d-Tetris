Grid = require('grid')

function love.load()
    love.graphics.setBackgroundColor(0, 0.5, 0.3)
    grid = Grid:init()
end 

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end 
end 

function love.draw()
    grid:draw()
end