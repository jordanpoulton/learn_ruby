def translate(string)
  string.split.each_with_index do |word|
    if word[0] =~ /[aeiou]/
      word << "ay "
    elsif word[0] =~ /[^aeiou]/ && word[1] =~ /[^aeiou]/ && word[2] =~ /[^aeiou]/
      word << "#{word[0..2]}ay "
      word[0..2] = ""
    elsif word[0] =~ /[^aeiou]/ && word[1] =~ /[^aeiouq]/
      word << "#{word[0..1]}ay "
      word[0..1] = ""
    elsif word[0] =~ /q/
      word << "#{word[0..1]}ay "
      word[0..1] = ""
    elsif word[1] =~ /q/
      word << "#{word[0..2]}ay "
      word[0..2] = ""
    else
      word << "#{word[0]}ay "
      word[0] = ""
    end
  end.join.strip
end
