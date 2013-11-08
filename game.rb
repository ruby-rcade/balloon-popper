require 'bundler'
Bundler.require

require_relative 'balloon'

class Game < Gosu::Window
  def initialize(width = 1024, height = 768, fullscreen = false)
    super
    @player1_balloon = Balloon.new(self, :red, self.width / 3, self.height - 20)
    @player2_balloon = Balloon.new(self, :green, self.width - self.width / 3, self.height - 20)
    @game_over = false
    @winner_text = Gosu::Font.new(self, Gosu::default_font_name, 46)
    @pop = Gosu::Image.new(self, "media/pop.png", false)
  end

  def button_down(button)
    case button
    when P1Button1, P1Button3 then @player1_balloon.inflate unless @game_over
    when P2Button1, P2Button3 then @player2_balloon.inflate unless @game_over
    when Quit then close
    end
  end

  def update
    if @player1_balloon.popped?
      @game_over = true
      @winner = :player1
    elsif @player2_balloon.popped?
      @game_over = true
      @winner = :player2
    end
  end

  def draw
    draw_background
    @player1_balloon.draw
    @player2_balloon.draw
    if @game_over
      draw_winner
    end
  end

  def draw_background
    color = 0xffffffff
    draw_quad(
      0, 0, color,
      self.width, 0, color,
      self.width, self.height, color,
      0, self.height, color
    )
  end

  def draw_winner
    x = @winner == :player1 ? self.width / 3 : self.width - self.width / 3 + 200
    z = 10
    @winner_text.draw 'Winner!', x - 175, 240, z + 1, 1, 1, 0xff000000
    @pop.draw x - @pop.width/2, 100, z, 0.8, 0.8
  end
end

Game.new.show