-- Author : Ahmed A. Khfagy
-- made in CS50 into to Game Development

-- this class is for the changing mode state

ChooseModeState = Class{__includes = BasicState}

function ChooseModeState:enter(params)

    self.players = params.players

    self.players['player-1'].score = 0
    self.players['player-2'].score = 0

end

function ChooseModeState:init()

    self.nowChange = 1

    self.isAI1 = false

    self.isAI2 = false

end

function ChooseModeState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then

        self.players['player-1'].isComputer = self.isAI1
        self.players['player-2'].isComputer = self.isAI2

        gStateMachine:change('serve',{
            players = self.players,
            toServe = 1,
            ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
        })

    end

    if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then

        sounds['changeLetter']:stop()
        sounds['changeLetter']:play()

        if self.nowChange == 1 then
            self.isAI1 = not self.isAI1
        else
            self.isAI2 = not self.isAI2
        end

    end

    if love.keyboard.wasPressed('1') and self.nowChange == 2 then
        sounds['changePlayerToName']:stop()
        sounds['changePlayerToName']:play()
        self.nowChange = 1
    elseif love.keyboard.wasPressed('2') and self.nowChange == 1 then
        sounds['changePlayerToName']:stop()
        sounds['changePlayerToName']:play()
        self.nowChange = 2
    end

    if love.keyboard.wasPressed('backspace') then
        gStateMachine:change('enter-name',{
            players = playerTable
        })
    end

end

function ChooseModeState:render()

    if self.nowChange == 1 then

        love.graphics.setColor(1, 1, 1, 1)

        love.graphics.setFont(smallFont)

        love.graphics.printf('-     Press 1 to edit player 1 mode', 0, 25, VIRTUAL_WIDTH, 'left')

        love.graphics.setColor(1, 1, 1, 133 / 255)

        love.graphics.printf('Press 2 to edit player 2 mode     -', 0, 25, VIRTUAL_WIDTH, 'right')

        love.graphics.setColor(1, 1, 1, 1)

        love.graphics.setFont(_largeFont)
        
        if self.isAI1 then
            love.graphics.setColor(1, 1, 1, 133 / 255)
            love.graphics.print('ME', VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 - 30)
        else
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print('ME', VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 - 30)
        end


        if self.isAI1 then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print('AI', VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 + 30)
        else
            love.graphics.setColor(1, 1, 1, 133 / 255)
            love.graphics.print('AI', VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 + 30)
        end


        if self.isAI2 then
            love.graphics.setColor(1, 1, 1, 133 / 255)
            love.graphics.print('ME', VIRTUAL_WIDTH - VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 - 30)
        else
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print('ME', VIRTUAL_WIDTH - VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 - 30)
        end


        if self.isAI2 then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print('AI', VIRTUAL_WIDTH - VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 + 30)
        else
            love.graphics.setColor(1, 1, 1, 133 / 255)
            love.graphics.print('AI', VIRTUAL_WIDTH - VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 + 30)
        end



    else

        love.graphics.setColor(1, 1, 1, 133 / 255)
        
        love.graphics.setFont(smallFont)
        
        love.graphics.printf('-     Press 1 to edit player 1 mode', 0, 25, VIRTUAL_WIDTH, 'left')
        
        love.graphics.setColor(1, 1, 1, 1)

        love.graphics.printf('Press 2 to edit player 2 mode     -', 0, 25, VIRTUAL_WIDTH, 'right')

        love.graphics.setFont(_largeFont)

        if self.isAI2 then
            love.graphics.setColor(1, 1, 1, 133 / 255)
            love.graphics.print('ME', VIRTUAL_WIDTH - VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 - 30)
        else
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print('ME', VIRTUAL_WIDTH - VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 - 30)
        end


        if self.isAI2 then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print('AI', VIRTUAL_WIDTH - VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 + 30)
        else
            love.graphics.setColor(1, 1, 1, 133 / 255)
            love.graphics.print('AI', VIRTUAL_WIDTH - VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 + 30)
        end

        
        if self.isAI1 then
            love.graphics.setColor(1, 1, 1, 133 / 255)
            love.graphics.print('ME', VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 - 30)
        else
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print('ME', VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 - 30)
        end


        if self.isAI1 then
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.print('AI', VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 + 30)
        else
            love.graphics.setColor(1, 1, 1, 133 / 255)
            love.graphics.print('AI', VIRTUAL_WIDTH / 5, VIRTUAL_HEIGHT / 2 + 30)
        end


    end

    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setFont(smallFont)

    love.graphics.printf('(Press backspace to change names..!)', 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('(Press Enter to Continue..!)', 0, VIRTUAL_HEIGHT - 20, VIRTUAL_WIDTH, 'center')


end

function ChooseModeState:exit()
    sounds['menuToAnother']:stop()
    sounds['menuToAnother']:play()
end