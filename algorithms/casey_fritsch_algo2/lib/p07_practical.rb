require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  hash = HashMap.new
  string.chars.each do |ch|
    if hash[ch.ord]
      hash[ch.ord] += 1
    else
      hash[ch.ord] = 1
    end
  end

  unpaired_el = 0
  hash.each do |key, val|
     unpaired_el += 1 unless val == 2
  end

  unpaired_el == 1
end
