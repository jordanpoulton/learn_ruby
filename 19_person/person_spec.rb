#DOUBLES

#A test double is an object that stands in for another object in your system during a code example. Use the double method, passing in an optional identifier, to create one:

# jumper = double("jumper")

# We can also give methods to the double, and specify what it should return when those methods are called:

# jumper = double("jumper", dry?: true)

# Such that if we were to do jumper.dry? this double would return true, just like we expect an *actual* jumper object to do in these circumstances.

#EG:

# describe "Some behaviour" do
#   it "example of behaviour" do
#     double = double("jumper", dry?: true)
#     expect(jumper.dry?).to be true
#   end
# end

# => Will pass!

# FYI people use Double, Mock, Spy, Fake... Technically each means something slightly different, but at this stage, all you really need to know is that 'double' is an umbrella term for all of them, and you can 'stub' a method and a response from any double that you crete.

# Now go and read these, slowly, and digest them:

# http://www.slideshare.net/TrietLeminh/basic-rspec-2
# (up to slide 21)

# http://www.slideshare.net/andrea.reginato/rspec-2-best-practices

# http://www.slideshare.net/patchspace/uses-abuses-of-mocks-stubs

# STUBS

# A method stub is an instruction to an object (real or test double) to return a known value in response to a message:
require 'person'

describe Person do
  context "when feeling cold" do
    it "can warm up by putting a jumper on" do
      jumper = double("jumper", dry?: true)
      person = Person.new(false)
      expect(person).to receive(:warm_up)
      person.put_on(jumper)
    end

# Notice that the expectation comes BEFORE the method call here. RSpec is effectively being told to listen out to receive the 'warm_up' message being sent to the person object when the put_on(jumper) method is called on it

    it "does not warm up by putting on a wet a jumper" do
      jumper = double("jumper", dry?: false)
      person = Person.new(false)
      expect(person).to receive(:cool_down)
      person.put_on(jumper)
    end
  end

# Do you see how, because the jumper double has been given the method dry?, and it is set to return false, when we pass it to the person, it activates line 11 in the Person class and executes cool down, which is exactly what our stub was listening for?

  context "when feeling hot" do
    it "cools down from putting on a wet t-shirt" do
      #create a t_shirt double that returns false when asked if it is 'dry', then create a warm person, test for the correct method stub (that the person recieves the cool_down message), and execute the person putting on the t-shirt.
    end
  end

  # Now, why not try to play around with Doubles & Mock responses? Stub some imaginary interaction with other objects. What about coding how the person would react to eating cake? Or eating vegetables? What happens if you want to raise an exception for when you try to have the person eat a scorpion??

end

#Reading:

# https://relishapp.com/rspec/rspec-mocks/v/3-2/docs/basics
