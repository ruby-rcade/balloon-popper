class Balloon
  def initialize(window, color, x, y, z = 1)
    @x, @y, @z = x, y, z
    @image = Gosu::Image.new(window, "media/#{color}-balloon.png", false)
    @pumper = Gosu::Image.load_tiles(window, "media/pumper.png", 150, 150, false)
    @popped = false
    @current_size = 5.0
    @pumper_state = 0
  end

  def inflate
    @current_size += 0.8
    @pumper_state = @pumper_state == 1 ? 0 : 1
  end

  def popped?
    @current_size > 100.00
  end

  def draw
    draw_pumper
    draw_balloon unless popped?
  end

  def draw_balloon
    factor = @current_size / 100.00
    center = @x - (@image.width/2 * factor)
    bottom = @y - (@image.height * factor) - 20
    @image.draw center, bottom, @z + 1, factor, factor
  end

  def draw_pumper
    @pumper[@pumper_state].draw @x, @y - 150, @z
  end
end