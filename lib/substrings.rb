def substrings(string, dictionary)
    newarray = []
    string = string.downcase
    dictionary.each do |word|
        word = word.downcase
        newarray.push(string.scan(word))
    end
    result = newarray.flatten.tally
    p result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "below"

substrings("Howdy partner, sit down! How's it going?",dictionary)