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
        line = {}
        for c = 0, self.xmax do 
            top = r * self.s 
            left = c * self.s 
            table.insert(line, {y=top, x=left, filled=false})
        end 
        table.insert(self.g, line)
    end
end 

function Grid:lay(piece)
    for k, v in pairs(piece.actual) do 
        top = v[2] + piece.y 
        left = v[1] + piece.x
        self.g[top][left+1].filled = true 
    end 
end 

function Grid:draw()
    for k, line  in pairs(self.g) do 
        for j, v in pairs(line) do 
            if v.filled == false then 
                love.graphics.rectangle('line', v.x, v.y, self.s, self.s)
            else
                love.graphics.rectangle('fill', v.x, v.y, self.s, self.s)
            end 
        end 
    end 
end 
return Grid