shapes = {}
square = {{0, 0},{0, 1},{1, 0},{1, 1}}

Shape = {}
Shape.__index = Shape

function Shape:init()
    self = setmetatable({}, self)
    self.s = 60
    self.xmax = (love.graphics.getWidth() / self.s) 
    self.ymax = (love.graphics.getHeight() / self.s) 
    self.x = love.math.random(0, self.xmax-2)
    self.y = 1
    self.sp = square
    self.actual = square
    self.s = 60
    self.timer = 0
    self.clock = 0.3
    self.out = false 
    return self 
end 



function Shape:move(dt)
    self.timer = self.timer + dt 
    if self.timer > self.clock then 
        self.y = self.y + 1
        self.timer = 0
    end 
    for k, v in pairs(self.actual) do 
        top = v[2] + self.y 
        if top >= self.ymax then 
            self.out = true 
        end 
    end 
end

function Shape:draw()
    for k, v in pairs(self.actual) do 
        top = (v[2] + self.y ) * self.s
        left = (v[1] + self.x) * self.s
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle('fill', left, top, self.s, self.s)
    end 
end 

return Shape 