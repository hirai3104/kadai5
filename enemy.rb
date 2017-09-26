# coding: utf-8

class Enemy < Sprite
  def update
    self.y += 1
    if self.y >= Window.height - self.image.height
      self.y=rand(250)
      self.x=rand(800)
    end
  end

  # 他のオブジェクトから衝突された際に呼ばれるメソッド
  def hit(obj)
    self.y=rand(250)
    self.x=rand(800)
  end
end