#This time, I want you to write the specs that test this class
# Your rake output should read:

#Burger
#  apply_ketchup
#    with ketchup
#      sets the ketchup flag to true
#    without ketchup
#      sets the ketchup flag to false

class Burger
  attr_reader :options

  def initialize(options={})
    @options = options
  end

  def apply_ketchup
    @ketchup = @options[:ketchup]
  end

  def has_ketchup_on_it?
    @ketchup
  end
end
