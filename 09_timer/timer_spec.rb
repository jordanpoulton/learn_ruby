# Now, we start using doubles. You don't need to understand it all right now, we'll go over it again later, by read this section - even if it doesn't make much sense to you right now:

# https://relishapp.com/rspec/rspec-core/v/3-2/docs/mock-framework-integration/mock-with-rspec

# # Topics
#
# * classes
# * instance variables
# * string formats
# * modular arithmetic
#
# # Timer

# Before you start, try to understand why you couldn't use a 'let' variable here in place of the 'before' hook...

require 'timer'

describe "Timer" do
  before(:each) do
    @timer = Timer.new
  end

  it "should initialize to 0 seconds" do
    expect(@timer.seconds).to eq 0
  end

  describe 'time_string' do
    it "should display 0 seconds as 00:00:00" do
      @timer.seconds = 0
      expect(@timer.time_string).to eq "00:00:00"
    end

    it "should display 12 seconds as 00:00:12" do
      @timer.seconds = 12
      expect(@timer.time_string).to eq "00:00:12"
    end

    it "should display 66 seconds as 00:01:06" do
      @timer.seconds = 66
      expect(@timer.time_string).to eq "00:01:06"
    end

    it "should display 4000 seconds as 01:06:40" do
      @timer.seconds = 4000
      expect(@timer.time_string).to eq "01:06:40"
    end
  end


  # One way to implement the Timer is with a helper method.
  # Uncomment these specs if you want to test-drive that
  # method, then call that method from inside of time_string.
  #
  # describe 'padded' do
  #   it 'pads zero' do
  #     expect(@timer.padded(0)).to eq '00'
  #   end
  #   it 'pads one' do
  #     expect(@timer.padded(1)).to eq '01'
  #   end
  #   it "doesn't pad a two-digit number" do
  #     expect(@timer.padded(12)).to eq '12'
  #   end
  # end

end
