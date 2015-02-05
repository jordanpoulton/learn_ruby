class Fixnum
  def in_words
    number = self
    if number == 0
      return 'zero'
    end
    numOutput = ''

    if number > 999999999999
      trillion = number / 1000000000000
      if trillion > 0
        numOutput += "#{trillion.in_words} trillion"
        number = number - (trillion * 1000000000000)
        if number > 0
          numOutput += ' '
        end
      end
    end

    if number > 999999999
      billions = number / 1000000000
      if billions > 0
        numOutput += "#{billions.in_words} billion"
        number = number - (billions * 1000000000)
        if number > 0
          numOutput += ' '
        end
      end
    end

    if number > 999999
      millions = number / 1000000
      if millions > 0
        numOutput = numOutput + "#{millions.in_words} million"
        number = number - (millions * 1000000)
        if number > 0
          numOutput += ' '
        end
      end
    end

    if number > 999
      thousands = number / 1000
      if thousands > 0
        numOutput = numOutput + "#{thousands.in_words} thousand"
        number = number - (thousands * 1000)
        if number > 0
          numOutput += ' '
        end
      end
    end

    if number > 99
      hundreds = number / 100
      if hundreds > 0
        # moreOutput = hundreds.in_words
        numOutput = numOutput + "#{hundreds.in_words} hundred"
        number = number - (hundreds * 100)
        if number > 0
          numOutput += ' '
        end
      end
    end

    tensDigit = number / 10
    onesDigit = number - tensDigit * 10
    ones = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
    tens = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
    teens = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'ten']
    if tensDigit == 1
      numOutput += teens[onesDigit - 1]
      return numOutput
    end
    if tensDigit > 1
      numOutput += tens[tensDigit - 1 ]
      if onesDigit > 0
        numOutput += ' '
      end
    end
    if onesDigit > 0
      numOutput += ones[onesDigit - 1]
    end
    return numOutput
  end # end in_words method
end # end class

#==============================
module Inwords
    def in_words
      number = self
      if number == 0
        return 'zero'
      end
      num_output = ''

      def thingz number, num_output, size, size_text
        if number > size - 1
          thisnum = number / size
          if thisnum > 0
            num_output = num_output + "#{thisnum.in_words} #{size_text}"
            number = number - (thisnum * size)
            if number > 0
              num_output += ' '
            end
          end
        end
        return number, num_output
      end

      number, num_output = thingz(number, num_output, 1000000000000, "trillion")
      number, num_output = thingz(number, num_output, 1000000000, "billion")
      number, num_output = thingz(number, num_output, 1000000, "million")
      number, num_output = thingz(number, num_output, 1000, "thousand")
      number, num_output = thingz(number, num_output, 100, "hundred")

      tens_digit = number / 10
      ones_digit = number - tens_digit * 10
      ones = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
      tens = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
      teens = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'ten']
      if tens_digit == 1
        num_output += teens[ones_digit - 1]
        return num_output
      end
      if tens_digit > 1
        num_output += tens[tens_digit - 1 ]
        if ones_digit > 0
          num_output += ' '
        end
      end
      if ones_digit > 0
        num_output += ones[ones_digit - 1]
      end
      return num_output
    end # end in_words method
end # end module


class Fixnum
    include Inwords
end

class Bignum
    include Inwords
end

#==========================================
module InWords
  def in_words
    number = self
    return 'zero' if number == 0

    ones = %w(one two three four five six seven eight nine)
    teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
    tens = %w(twenty thirty forty fifty sixty seventy eighty ninety)
    high = %w(thousand million billion trillion)

    phrase = []
    segments = number.to_s.reverse.scan(/.{1,3}/).map { |s| s.reverse.to_i }

    segments.each_with_index do |segment, i|
      if segment > 0
        words = []
        words << [ones[segment / 100 - 1], 'hundred'] if segment >= 100

        if segment % 100 > 0
          if segment % 100 >= 10 && segment % 100 < 20
            words << teens[segment % 100 - 10]
          else
            words << tens[segment % 100 / 10 - 2] if segment % 100 >= 20
            words << ones[segment % 10 - 1] if segment % 10 > 0
          end
        end

        unless words.empty?
          words << high[i-1] unless i == 0
          phrase << words.join(' ')
        end
      end
    end
    phrase.reverse.join(' ')
  end
end

class Fixnum
  include InWords
end

class Bignum
  include InWords
end

#==============================
