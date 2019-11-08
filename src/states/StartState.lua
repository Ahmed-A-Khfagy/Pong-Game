-- Author : Ahmed A. Khfagy
-- made in CS50 into to Game Development

-- this class is the Starting state of the game

StartState = Class{__includes = BasicState}

function StartState:init()

    playerTable = {
        ['player-1'] = Player(10, 30, 5, 20, 'player1', false, 1),
        ['player-2'] = Player(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 5, 20, 'player1', false, 2)
    }

end

function StartState:update(dt)

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('enter-name',{
            players = playerTable
        })
    end

end

function StartState:render()

    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setFont(_largeFont)

    love.graphics.printf('Welcome to Pong!', 0, 10, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(smallFont)

    love.graphics.printf('Press Enter to start..!', 0, VIRTUAL_HEIGHT / 2 - 8 , VIRTUAL_WIDTH, 'center')

end

function StartState:enter() end

function StartState:exit()
    sounds['menuToAnother']:stop()
    sounds['menuToAnother']:play()
end
