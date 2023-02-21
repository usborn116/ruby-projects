class Substring
  def substrings(string, dictionary)
    p dictionary.map {|word| string.downcase.scan(word.downcase)}.flatten.tally
  end
end

dictionary = %w(below down go going horn how howdy it i low own part partner sit)

Substring.new.substrings("Howdy partner, sit down! How's it going?", dictionary)