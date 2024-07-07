Tile = Class{}

function Tile:init(x, y, color, variety, shiny)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32


    --shiny block
    self.toggle = false

    -- tile appearance/points
    self.color = color
    self.variety = variety
    self.shiny = shiny


    --shiny block
    Timer.every(0.5, function()
        self.toggle = not self.toggle
    end)
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34/255, 32/255, 52/255, 255/255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    --shiny block toggle to show
    if self.shiny == true and self.toggle then
        love.graphics.setColor(255/255, 255/255, 255/255, 100/255) 
    else
      love.graphics.setColor(255/255, 255/255, 255/255, 255/255)   
    end

    -- draw tile itself
       love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
end