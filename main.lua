-- Função que tranforma rgb em decimal em rgb que o LOVE entende
function color(r, g, b)
  return {r/255, g/255, b/255}
end

-- x da nuvem
x = 450
-- direcao da nuvem
left = true

function love.update(dt)
  if x-50 < 0 then
    left = false
  end
  if x+50+210 > 800 then
    left = true
  end

  if left then
    x = x - dt * 100
  else 
    x = x + dt * 100
  end
end

function love.draw()
  -- cores
  blue = color(0,0,255)
  light_blue = color(0,191,255)
  dark_blue = color(0,0,139)
  green = color(0,255,0)
  yellow = color(255,255,0)
  brown = color(139,69,19)
  light_brown = color(160,82,45)
  black = color(0,0,0)
  white = color(255,255,255)
  gray = color(144,144,144)

  -- fundo
  -- fica escuro quando a nuvem cobre pelo menos metade do sol
  if x - 50 <= 100 then
    love.graphics.setBackgroundColor(dark_blue)
  else
    love.graphics.setBackgroundColor(light_blue)
  end

  -- grama
  love.graphics.setColor(green)
  love.graphics.rectangle("fill", 0, 500, 800, 600)

  -- tronco
  love.graphics.setColor(brown)
  love.graphics.rectangle("fill", 650, 300, 50, 200)

  -- folhas
  love.graphics.setColor(green)
  love.graphics.circle("fill", 675, 250, 100, 100)

  -- parede
  love.graphics.setColor(gray)
  love.graphics.rectangle("fill", 200, 300, 200, 200)

  -- telhado
  love.graphics.setColor(light_brown)
  love.graphics.polygon("fill", 200, 300, 400, 300, 300, 175)

  -- janela
  love.graphics.setColor(blue)
  love.graphics.rectangle("fill", 220, 350, 70, 90)

  -- porta 
  love.graphics.setColor(brown)
  love.graphics.rectangle("fill", 310, 350, 70, 150)

  -- maçaneta
  love.graphics.setColor(black)
  love.graphics.circle("fill", 325, 425, 9, 9)

  -- sol
  love.graphics.setColor(yellow)
  love.graphics.circle("fill", 100, 100, 50, 50)

  -- raios de sol
  love.graphics.setLineWidth(4)
  love.graphics.line(25, 25, 175, 175)
  love.graphics.line(175, 25, 25, 175)
  love.graphics.line(100, 0, 100, 200)
  love.graphics.line(0, 100, 200, 100)

  -- nuvem
  love.graphics.setColor(white)
  love.graphics.circle("fill", x, 100, 50, 50)
  love.graphics.circle("fill", x + 70, 100, 50, 50)
  love.graphics.circle("fill", x + 140, 100, 50, 50)
  love.graphics.circle("fill", x + 210, 100, 50, 50)

end