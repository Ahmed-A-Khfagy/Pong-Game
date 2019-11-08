-- Author : Ahmed A. Khfagy
-- made in CS50 into to Game Development

-- this class is for the player object

Player = Class{}

function Player:init(x, y, width, height, name, isComputer, num)

    self.paddle = Paddle(x, y, width, height)

    self.name = name

    self.isComputer = isComputer 

    self.score = 0

    self.num = num

    self.chars = {
        [1] = 80,
        [2] = 76,
        [3] = 65,
        [4] = 89,
        [5] = 69,
        [6] = 82,
        [7] = string.byte(self.num)
    }

end

function Player:update(dt)

    self.paddle:update(dt)

end

function Player:render()

    self.paddle:render()

end