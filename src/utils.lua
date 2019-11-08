-- Author : Ahmed A. Khfagy
-- done in CS50 intorduction to game Design course


function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
    love.graphics.setColor(1, 1, 1, 1)
end

function displayScore(players)
    -- draw score on the left and right center of the screen
    -- need to switch font to draw before actually printing
    love.graphics.setFont(scoreFont)
    love.graphics.print(players['player-1'].name, VIRTUAL_WIDTH / 2 - 180, VIRTUAL_HEIGHT / 2)
    love.graphics.print(tostring(players['player-1'].score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(players['player-2'].name, VIRTUAL_WIDTH / 2 + 70, VIRTUAL_HEIGHT / 2)
    love.graphics.print(tostring(players['player-2'].score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)
end

function movePaddle(players, ball)

    if players['player-1'].isComputer then

        if ball.dx < 0 then

            if math.floor(ball.y) < math.floor(players['player-1'].paddle.y) + 10 then
                players['player-1'].paddle.dy = -PADDLE_SPEED
            elseif math.floor(ball.y) > math.floor(players['player-1'].paddle.y) + 10 then
                players['player-1'].paddle.dy = PADDLE_SPEED
            else
                players['player-1'].paddle.dy = 0
            end

        else

            players['player-1'].paddle.dy = 0

        end

    else

        if love.keyboard.isDown('w') then
            players['player-1'].paddle.dy = -PADDLE_SPEED
        elseif love.keyboard.isDown('s') then
            players['player-1'].paddle.dy = PADDLE_SPEED
        else
            players['player-1'].paddle.dy = 0
        end

    end

    if players['player-2'].isComputer then

        if ball.dx > 0 then

            if math.floor(ball.y) < math.floor(players['player-2'].paddle.y) + 10 then
                players['player-2'].paddle.dy = -PADDLE_SPEED
            elseif math.floor(ball.y) > math.floor(players['player-2'].paddle.y) + 10 then
                players['player-2'].paddle.dy = PADDLE_SPEED
            else
                players['player-2'].paddle.dy = 0
            end

        else

            players['player-2'].paddle.dy = 0

        end

    else

        if love.keyboard.isDown('up') then
            players['player-2'].paddle.dy = -PADDLE_SPEED
        elseif love.keyboard.isDown('down') then
            players['player-2'].paddle.dy = PADDLE_SPEED
        else
            players['player-2'].paddle.dy = 0
        end

    end

end

function ballMovement(players, ball)

    if ball:collides(players['player-1'].paddle) then
        ball.dx = -ball.dx * 1.03
        ball.x = players['player-1'].paddle.x + 5
        if ball.dy < 0 then
            ball.dy = -math.random( 10, 150 )
        else 
            ball.dy = math.random( 10, 150 )
        end
        sounds['paddle_hit']:play()
    end

    if ball:collides(players['player-2'].paddle) then
        ball.dx = -ball.dx * 1.03
        ball.x = players['player-2'].paddle.x - 4
        if ball.dy < 0 then
            ball.dy = -math.random( 10, 150)
        else 
            ball.dy = math.random( 10, 150 )
        end
        sounds['paddle_hit']:play()
    end

    if ball.y <= 0 then

        ball.y = 0
        ball.dy = -ball.dy
        sounds['wall_hit']:play()

    end

    if ball.y >= VIRTUAL_HEIGHT - 4 then

        ball.y = VIRTUAL_HEIGHT - 4
        ball.dy = -ball.dy
        sounds['wall_hit']:play()

    end

end