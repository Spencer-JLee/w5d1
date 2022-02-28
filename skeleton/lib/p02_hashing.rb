class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    str = ""
    self.each do |n|
      str += n.to_s
    end
    str.to_i
  end
end

class String
  def hash
    alphabet = ("a".."z").to_a
    str = ""
    self.each_char do |char|
      index = alphabet.index(char)
      str += index.to_s
    end
    str.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    str = ""
    keys = []
    values = []

    self.each do |key, value|
      keys.push(key)
      values.push(value)
    end

    keys.sort
    values.sort

    keys.each do |key|
      str += key.hash.to_s
    end

    values.each do |value|
      str += value.hash.to_s
    end

    str.to_i
  end
end
