# coding: utf-8
require 'dxruby'

require_relative 'player'
require_relative 'enemy'

Window.width  = 800
Window.height = 600

player_img = Image.load("roket.png")
player_img.setColorKey([0, 0, 0])

enemy_img = Image.load("ufo.png")
enemy_img.setColorKey([0, 0, 0])

player = Player.new(400, 500, player_img)

font = Font.new(32)

enemies = []
40.times do
  enemies << Enemy.new(rand(800), rand(400), enemy_img)
end

score = 0
high_score = 0

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Window.draw_font(0, 0, "   score:  #{score} \nhigh score:#{high_score}", font)
  score += 1
  
  Sprite.update(enemies)
  Sprite.draw(enemies)

  player.update
  player.draw

  # 当たり判定
  if player === enemies
    if high_score < score
      high_score = score
    end
    score = 0
  end
  Sprite.check(player, enemies)
end
