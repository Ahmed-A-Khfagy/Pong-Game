-- Author : Ahmed A. Khfagy
-- made in CS50 into to Game Development

-- this class is for the entering name state

-- A to Z is 65 -> 90

EnterNameState = Class{__includes = BasicState}

local startOfNum = string.byte('1')

local endOfNum = string.byte('9')

local startOfLeter = string.byte('A')

local endOfLeter = string.byte('Z')

function EnterNameState:enter(params)

    self.players = params.players

end

function EnterNameState:init()

    self.nowChange = 1
    self.toEditChar = 1

end

function EnterNameState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then

        self.players['player-1'].name = string.char(self.players['player-1'].chars[1]) .. string.char(self.players['player-1'].chars[2]) .. string.char(self.players['player-1'].chars[3]) .. string.char(self.players['player-1'].chars[4]) .. string.char(self.players['player-1'].chars[5]) .. string.char(self.players['player-1'].chars[6]) .. string.char(self.players['player-1'].chars[7])
        self.players['player-2'].name = string.char(self.players['player-2'].chars[1]) .. string.char(self.players['player-2'].chars[2]) .. string.char(self.players['player-2'].chars[3]) .. string.char(self.players['player-2'].chars[4]) .. string.char(self.players['player-2'].chars[5]) .. string.char(self.players['player-2'].chars[6]) .. string.char(self.players['player-2'].chars[7])

        gStateMachine:change('choose-mode',{
            players = self.players
        })


    end

    if self.nowChange == 1 then

        if love.keyboard.wasPressed('left') and self.toEditChar > 1 then
            sounds['changeLetter']:stop()
            sounds['changeLetter']:play()
            self.toEditChar = self.toEditChar - 1
        end

        if love.keyboard.wasPressed('right') and self.toEditChar < 7 then
            sounds['changeLetter']:stop()
            sounds['changeLetter']:play()
            self.toEditChar = self.toEditChar + 1
        end

        if love.keyboard.wasPressed('up') then

            if self.players['player-1'].chars[self.toEditChar] >= startOfLeter and self.players['player-1'].chars[self.toEditChar] <= endOfLeter then
                self.players['player-1'].chars[self.toEditChar] = self.players['player-1'].chars[self.toEditChar] - 1
                if self.players['player-1'].chars[self.toEditChar] < startOfLeter then
                    self.players['player-1'].chars[self.toEditChar] = endOfNum
                end
            elseif self.players['player-1'].chars[self.toEditChar] >= startOfNum and self.players['player-1'].chars[self.toEditChar] <= endOfNum then
                self.players['player-1'].chars[self.toEditChar] = self.players['player-1'].chars[self.toEditChar] - 1
                if self.players['player-1'].chars[self.toEditChar] < startOfNum then
                    self.players['player-1'].chars[self.toEditChar] = endOfLeter
                end
            end

        elseif love.keyboard.wasPressed('down') then

            if self.players['player-1'].chars[self.toEditChar] >= startOfLeter and self.players['player-1'].chars[self.toEditChar] <= endOfLeter then
                self.players['player-1'].chars[self.toEditChar] = self.players['player-1'].chars[self.toEditChar] + 1
                if self.players['player-1'].chars[self.toEditChar] > endOfLeter then
                    self.players['player-1'].chars[self.toEditChar] = startOfNum
                end
            elseif self.players['player-1'].chars[self.toEditChar] >= startOfNum and self.players['player-1'].chars[self.toEditChar] <= endOfNum then
                self.players['player-1'].chars[self.toEditChar] = self.players['player-1'].chars[self.toEditChar] + 1
                if self.players['player-1'].chars[self.toEditChar] > endOfNum then
                    self.players['player-1'].chars[self.toEditChar] = startOfLeter
                end
            end
        end

    else

        if love.keyboard.wasPressed('left') and self.toEditChar > 1 then
            sounds['changeLetter']:stop()
            sounds['changeLetter']:play()
            self.toEditChar = self.toEditChar - 1
        end

        if love.keyboard.wasPressed('right') and self.toEditChar < 7 then
            sounds['changeLetter']:stop()
            sounds['changeLetter']:play()
            self.toEditChar = self.toEditChar + 1
        end

        if love.keyboard.wasPressed('up') then

            if self.players['player-2'].chars[self.toEditChar] >= startOfLeter and self.players['player-2'].chars[self.toEditChar] <= endOfLeter then
                self.players['player-2'].chars[self.toEditChar] = self.players['player-2'].chars[self.toEditChar] - 1
                if self.players['player-2'].chars[self.toEditChar] < startOfLeter then
                    self.players['player-2'].chars[self.toEditChar] = endOfNum
                end
            elseif self.players['player-2'].chars[self.toEditChar] >= startOfNum and self.players['player-2'].chars[self.toEditChar] <= endOfNum then
                self.players['player-2'].chars[self.toEditChar] = self.players['player-2'].chars[self.toEditChar] - 1
                if self.players['player-2'].chars[self.toEditChar] < startOfNum then
                    self.players['player-2'].chars[self.toEditChar] = endOfLeter
                end
            end

        elseif love.keyboard.wasPressed('down') then

            if self.players['player-2'].chars[self.toEditChar] >= startOfLeter and self.players['player-2'].chars[self.toEditChar] <= endOfLeter then
                self.players['player-2'].chars[self.toEditChar] = self.players['player-2'].chars[self.toEditChar] + 1
                if self.players['player-2'].chars[self.toEditChar] > endOfLeter then
                    self.players['player-2'].chars[self.toEditChar] = startOfNum
                end
            elseif self.players['player-2'].chars[self.toEditChar] >= startOfNum and self.players['player-2'].chars[self.toEditChar] <= endOfNum then
                self.players['player-2'].chars[self.toEditChar] = self.players['player-2'].chars[self.toEditChar] + 1
                if self.players['player-2'].chars[self.toEditChar] > endOfNum then
                    self.players['player-2'].chars[self.toEditChar] = startOfLeter
                end
            end

        end

    end

    if love.keyboard.wasPressed('1') and self.nowChange == 2 then
        sounds['changePlayerToName']:stop()
        sounds['changePlayerToName']:play()
        self.toEditChar = 1
        self.nowChange = 1
    elseif love.keyboard.wasPressed('2') and self.nowChange == 1 then
        sounds['changePlayerToName']:stop()
        sounds['changePlayerToName']:play()
        self.toEditChar = 1
        self.nowChange = 2
    end

    if love.keyboard.wasPressed('backspace') then
        gStateMachine:change('start')
    end
    
end

function EnterNameState:render()

    if self.nowChange == 1 then

        love.graphics.setColor(1, 1, 1, 1)

        love.graphics.setFont(smallFont)

        love.graphics.printf('-     Press 1 to edit player 1 name', 0, 25, VIRTUAL_WIDTH, 'left')

        love.graphics.setFont(_largeFont)

        local player1Place = VIRTUAL_WIDTH / 2 - 180

        local player2Place = VIRTUAL_WIDTH / 2 + (VIRTUAL_WIDTH / 2 - ((6 * 16) + player1Place)) - 12

        for i = 1, 7 do 

            if self.toEditChar == i then
                love.graphics.setColor(1, 1, 1, 1)
            else
                love.graphics.setColor(1, 1, 1, 133 / 255)
            end

            love.graphics.print(string.char(self.players['player-1'].chars[i]), player1Place + (i - 1) * 16, VIRTUAL_HEIGHT / 2)

        end

        love.graphics.setColor(1, 1, 1, 133 / 255)

        love.graphics.setFont(smallFont)

        love.graphics.printf('Press 2 to edit player 2 name     -', 0, 25, VIRTUAL_WIDTH, 'right')

        love.graphics.setFont(_largeFont)

        for i = 1, 7 do 

            love.graphics.print(string.char(self.players['player-2'].chars[i]), player2Place + (i - 1) * 16, VIRTUAL_HEIGHT / 2)

        end

    elseif self.nowChange == 2 then

        love.graphics.setColor(1, 1, 1, 133 / 255)

        love.graphics.setFont(smallFont)

        love.graphics.printf('-     Press 1 to edit player 1 name', 0, 25, VIRTUAL_WIDTH, 'left')

        love.graphics.setFont(_largeFont)

        local player1Place = VIRTUAL_WIDTH / 2 - 180

        local player2Place = VIRTUAL_WIDTH / 2 + (VIRTUAL_WIDTH / 2 - ((6 * 16) + player1Place)) - 12

        for i = 1, 7 do 

            love.graphics.print(string.char(self.players['player-1'].chars[i]), player1Place + (i - 1) * 16, VIRTUAL_HEIGHT / 2)

        end

        love.graphics.setColor(1, 1, 1, 1)

        love.graphics.setFont(smallFont)

        love.graphics.printf('Press 2 to edit player 2 name     -', 0, 25, VIRTUAL_WIDTH, 'right')

        love.graphics.setFont(_largeFont)

        for i = 1, 7 do 
            
            if self.toEditChar == i then
                love.graphics.setColor(1, 1, 1, 1)
            else
                love.graphics.setColor(1, 1, 1, 133 / 255)
            end

            love.graphics.print(string.char(self.players['player-2'].chars[i]), player2Place + (i - 1) * 16, VIRTUAL_HEIGHT / 2)

        end

    end

    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setFont(smallFont)

    love.graphics.printf('(Press backspace to go back to the main menu..!)', 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, 'center')
    
    love.graphics.printf('(Press Enter to Continue..!)', 0, VIRTUAL_HEIGHT - 20, VIRTUAL_WIDTH, 'center')

end

function EnterNameState:exit()
    sounds['menuToAnother']:stop()
    sounds['menuToAnother']:play()
end