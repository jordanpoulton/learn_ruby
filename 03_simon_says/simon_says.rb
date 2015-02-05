def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string, iterations=2)
  output = ""
  iterations.times do |iteration|
    output << "#{string} "
  end
  output.strip
end

def start_of_word(string, letters)
  string[0...letters]
end

def first_word(string)
  string =~ /(.*)\s/
  $1
end

def titleize(string)
  output = ""
  string.split.each_with_index do |word, index|
    if (word == "and" || word == "the" || word == "over") && index != 0
      output << word + " "
    else
      output << word[0].upcase!
      output << word[1..-1] + " "
    end
  end
  output.strip
end
#So ugly. Can be refactored.

