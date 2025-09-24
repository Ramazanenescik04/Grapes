local gui = {}

function gui.newScreen()
    local screen = {}

    screen.compenents = {}
    screen.addComponent = function(self, component)
        table.insert(self.compenents, component)
    end
    screen.removeComponent = function(self, component)
        for i, comp in ipairs(self.compenents) do
            if comp == component then
                table.remove(self.compenents, i)
                break
            end
        end
    end

    screen.draw = function(self)
        for _, component in ipairs(self.compenents) do
            if component.draw then
                component:draw()
            end
        end
    end

    screen.tick = function(self, dt)
        for _, component in ipairs(self.compenents) do
            if component.tick then
                component:tick(dt)
            end
        end
    end

    screen.mousepressed = function(self, x, y, button)
        for _, component in ipairs(self.compenents) do
            if component.mousepressed then
                component:mousepressed(x, y, button)
            end
        end
    end

    screen.mousereleased = function(self, x, y, button)
        for _, component in ipairs(self.compenents) do
            if component.mousereleased then
                component:mousereleased(x, y, button)
            end
        end
    end

    --Keyboard events

    screen.keypressed = function(self, key)
        for _, component in ipairs(self.compenents) do
            if component.keypressed then
                component:keypressed(key)
            end
        end
    end

    screen.keyreleased = function(self, key)
        for _, component in ipairs(self.compenents) do
            if component.keyreleased then
                component:keyreleased(key)
            end
        end
    end

    return screen
end

function gui.newComponent()
    local component = {}
    -- Default empty methods
    function compenent.draw() end
    function component.tick(dt) end
    function component.mousepressed(x, y, button) end
    function component.mousereleased(x, y, button) end
    function component.keypressed(key) end
    function component.keyreleased(key) end

    return component
end

function gui.newButton()
   local button = gui.newComponent()
   return button 
end

return gui