# LuhnValidator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.reverse.chars.map(&:to_i)
    digitsum = nums_a.each.with_index.inject(0) do |sum, (num, index)|
      digit = num.to_i
      sum + ((index % 2).zero? ? digit : (digit * 2 % 10) + (digit * 2 / 10))
    end
    (digitsum % 10).zero? ? true : false
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
