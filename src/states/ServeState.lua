-- Author : Ahmed A. Khfagy
-- made in CS50 into to Game Development

-- this class is for the serving state

ServeState = Class{__includes = BasicState}

function ServeState:enter(params)

    self.players = params.players

    self.toServe = params.toServe

    self.ball = params.ball

    self.ball:reset()

end

function ServeState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then

        self.ball.dy = math.random( 2 ) == 1 and math.random(10, 60) or -math.random(10, 60)
        if self.toServe == 1 then
            self.ball.dx = math.random(140, 160)
        else
            self.ball.dx = -math.random(140, 160)
        end

        gStateMachine:change('play',{
            ball = self.ball,
            players = self.players
        })

    end

    if love.keyboard.wasPressed('backspace') then
        gStateMachine:change('choose-mode',{
            players = self.players
        })
    end
    
    movePaddle(self.players, self.ball)
    
    self.players['player-1'].paddle:update(dt)
    self.players['player-2'].paddle:update(dt)
    
end

function ServeState:render()
    
    displayScore(self.players)

    love.graphics.setFont(smallFont)

    if self.toServe == 1 then
        love.graphics.printf(self.players['player-1'].name .. "'s serve!", 0, 10, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf(self.players['player-2'].name .. "'s serve!", 0, 10, VIRTUAL_WIDTH, 'center')
    end


    if self.players['player-1'].score > 0 or self.players['player-2'].score > 0 then
        love.graphics.printf('(Press Escape to change modes (scores will be reset) .. !', 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, 'center')
    else
        love.graphics.printf('(Press backspace to change modes..!)', 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, 'center')
    end

    love.graphics.printf('(Press Enter to serve..!)', 0, 20, VIRTUAL_WIDTH, 'center')

    self.players['player-1'].paddle:render()
    self.players['player-2'].paddle:render()
    self.ball:render()

end

function ServeState:exit()
    sounds['menuToAnother']:stop()
    sounds['menuToAnother']:play()
end