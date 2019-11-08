-- Author : Ahmed A. Khfagy
-- From CS50 introduction to game development course

require 'src/Dependancies'

function love.load()
    -- to blur the text
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('My First Game <3')
    -- set to the current time of the device because it is different every single time
    -- os.time() is based on unix epoch time
    math.randomseed(os.time())
    smallFont = love.graphics.newFont('fonts/font.ttf', 8)
    _largeFont = love.graphics.newFont('fonts/font.ttf', 16)
    scoreFont = love.graphics.newFont('fonts/font.ttf', 32)

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    sounds = {
        ['paddle_hit'] = love.audio.newSource('sounds/paddle_hit.wav', 'static'),
        ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
        ['wall_hit'] = love.audio.newSource('sounds/wall_hit.wav', 'static'),
        ['changeLetter'] = love.audio.newSource('sounds/changePlayerToName.wav', 'static'),
        ['changePlayerToName'] = love.audio.newSource('sounds/changeLetter.wav', 'static'),
        ['loose'] = love.audio.newSource('sounds/loose.wav', 'static'),
        ['music'] = love.audio.newSource('sounds/music.wav', 'static'),
        ['menuToAnother'] = love.audio.newSource('sounds/menuToAnother.wav', 'static')
    }

    sounds['music']:play()
    sounds['music']:setLooping(true) 

    gStateMachine = StateMachine{
        ['enter-name'] = function() return EnterNameState() end,
        ['start'] = function() return StartState() end,
        ['choose-mode'] = function() return ChooseModeState() end,
        ['serve'] = function() return ServeState() end,
        ['play'] = function() return PlayState() end,
        ['the-end'] = function() return VictoryState() end
    }    

    gStateMachine:change('start')

    love.keyboard.keysPressed = {}

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)
    
    gStateMachine:update(dt)

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    love.keyboard.keysPressed = {}

end

function love.keyboard.wasPressed(key)

    return love.keyboard.keysPressed[key]

end

function love.keypressed(key)

    love.keyboard.keysPressed[key] = true

end

function love.draw()

    push:apply('start')

    love.graphics.clear(40/255, 45/255, 52/255, 1)
    
    gStateMachine:render()

    displayFPS()

    push:apply('end')

end
