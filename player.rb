class Player
  attr_accessor :lives, :id
  def initialize(id)
    @lives = 3
    @id = id
  end
end