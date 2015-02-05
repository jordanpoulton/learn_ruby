# Write the tests to cover this class.
# Your rake output should read:

# Bike
#  should not be broken after we create it
#  should be able to break
#  should be able to get fixed

class Bike

  def initialize
    @broken = false
  end

  def broken?
    @broken
  end

  def break!
    @broken = true
  end

  def fix!
    @broken = false
  end

end
