module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.reverse.chars.map(&:to_i)
    digitsum = 0
    nums_a.each_index do |index|
      digit = nums_a[index].to_i
      digitsum += if (index % 2).zero? # nothing
                    digit
                  else # multi by 2
                    (digit * 2 % 10) + (digit * 2 / 10)
                  end
    end
    digitsum % 10.zero? ? true : false

    # TODO: use the integers in nums_a to validate its last check digit
  end
end
