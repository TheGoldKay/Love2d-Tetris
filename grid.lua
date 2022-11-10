Grid = {}
Grid.__index = Grid 

function Grid:init()
    self = setmetatable({}, self)
    self.s = 60
    self.xmax = (love.graphics.getWidth() / self.s) - 1
    self.ymax = (love.graphics.getHeight() / self.s) - 1
    self:makeGrid()
    return self
end 

function Grid:makeGrid()
    self.g = {}
    for r = 0, self.ymax do
        for c = 0, self.xmax do 
            top = r * self.s 
            left = c * self.s 
            table.insert(self.g, {y=top, x=left})
        end 
    end
end 

function Grid:draw()
    for k, v in pairs(self.g) do 
        love.graphics.rectangle('line', v.x, v.y, self.s, self.s)
    end 
end 
return Grid