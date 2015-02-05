class Person

  attr_accessor :warm

  def initialize(warm = nil)
    @warm = warm
  end

  def put_on(clothing)
    warm_up if clothing.dry?
    cool_down unless clothing.dry?
  end

  def warm_up
    @warm = true
  end

  def cool_down
    @warm = false
  end

end
