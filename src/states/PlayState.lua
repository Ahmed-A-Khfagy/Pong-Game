-- Author : Ahmed A. Khfagy
-- made in CS50 into to Game Development

-- this class is for the playing state

PlayState = Class{__includes = BasicState}

function PlayState:enter(params)

    self.ball = params.ball
    self.players = params.players

end

local pause = false

function PlayState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        pause = not pause
    end

    if not pause then

        ballMovement(self.players, self.ball)

        movePaddle(self.players, self.ball)

        if self.ball.x < 0 then

            self.players['player-2'].score = self.players['player-2'].score + 1

            if self.players['player-2'].score == 10 then
                gStateMachine:change('the-end',{
                    players = self.players,
                    winner = 2,
                    ball = self.ball
                })
            else
                gStateMachine:change('serve',{
                    players = self.players,
                    toServe = 1,
                    ball = self.ball
                })
            end

            sounds['score']:play()

        end

        if self.ball.x > VIRTUAL_WIDTH - 4 then

            self.players['player-1'].score = self.players['player-1'].score + 1

            if self.players['player-1'].score == 10 then
                gStateMachine:change('the-end',{
                    players = self.players,
                    winner = 1,
                    ball = self.ball
                })
            else
                gStateMachine:change('serve',{
                    players = self.players,
                    toServe = 2,
                    ball = self.ball
                })
            end

            sounds['score']:play()

        end
        
        self.ball:update(dt)
        self.players['player-1'].paddle:update(dt)
        self.players['player-2'].paddle:update(dt)

    end

    if pause then
        
        if love.keyboard.wasPressed('backspace') then
            gStateMachine:change('choose-mode',{
                players = self.players
            })
        end

    end

end

function PlayState:render()

    if pause then

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setFont(scoreFont)
        love.graphics.printf('PAUSED!!', 0, VIRTUAL_HEIGHT / 2 - 15, VIRTUAL_WIDTH, 'center')
        love.graphics.setFont(smallFont)
        love.graphics.printf('(Press Enter to continue..!)', 0, VIRTUAL_HEIGHT - 20, VIRTUAL_WIDTH, 'center')
        if self.players['player-1'].score > 0 or self.players['player-2'].score > 0 then
            love.graphics.printf('(Press Escape to change modes (scores will be reset) .. !', 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, 'center')
        else
            love.graphics.printf('(Press Escape to change modes..!)', 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, 'center')
        end

    else

        love.graphics.setColor(1, 1, 1, 133 / 255)
        love.graphics.setFont(smallFont)
        love.graphics.printf('(Press Enter to pause..!)', 0, VIRTUAL_HEIGHT - 12, VIRTUAL_WIDTH, 'center')
        love.graphics.setColor(1, 1, 1, 1)

    end

    self.players['player-1'].paddle:render()
    self.players['player-2'].paddle:render()
    self.ball:render()

end

function PlayState:exit()
    sounds['menuToAnother']:stop()
    sounds['menuToAnother']:play()
end