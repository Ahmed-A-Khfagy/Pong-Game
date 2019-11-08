-- Author : Ahmed A. Khfagy
-- made in CS50 into to Game Development

-- this class is for the victory state

VictoryState = Class{__includes = BasicState}

function VictoryState:enter(params)

    self.players = params.players

    self.winner = params.winner

    self.ball = params.ball

end

function VictoryState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then

        self.players['player-1'].score = 0
        self.players['player-2'].score = 0
    
        gStateMachine:change('serve',{
            players = self.players,
            toServe = self.winner == 1 and 2 or 1,
            ball = self.ball
        })
    end

    if love.keyboard.wasPressed('backspace') then
        gStateMachine:change('start')
    end

end

function VictoryState:render()

    love.graphics.setFont(_largeFont)
    if self.winner == 1 then
        love.graphics.printf(self.players['player-1'].name .. ' WINS!', 0, 10, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf(self.players['player-2'].name .. ' WINS!', 0, 10, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.printf('Press enter to play again..!', 0, 30, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press backspace to return to the main menu!', 0, 60, VIRTUAL_WIDTH, 'center')

end

function VictoryState:exit()
    sounds['menuToAnother']:stop()
    sounds['menuToAnother']:play()
end