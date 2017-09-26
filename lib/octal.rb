require 'pry'
class Octal
  def initialize(octal_number)
      @octal_number = octal_number.to_i
  end

  def to_decimal
    return 0 if invalid?(@octal_number)
    collection = @octal_number.digits.reverse
    overlay = base8_overlay(@octal_number)
    results = collection.map.with_index do |value, index|
      value * overlay[index]
    end
    results.reduce(:+)
  end

  def base8_overlay(octal_number)
    counter = 1
    bucket = []
    loop do
      bucket << counter
      break if bucket.size == octal_number.to_s.size
      counter *= 8
    end
    bucket.reverse
  end

  def invalid?(n)
    n.zero? || n.digits.include?(9) || n.digits.include?(8)
  end
end


p Octal.new('17').to_decimal
