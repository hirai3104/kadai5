# coding: utf-8

class Player < Sprite
  def update
    self.x += Input.x * 3
    self.y += Input.y * 3
  end
end