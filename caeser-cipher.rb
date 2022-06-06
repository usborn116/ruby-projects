def caeser_cipher(string, num)
    ascii = string.chars.map{|c| c.ord}
    p ascii
    shifted = ascii.map {|c| c + num}
    p shifted
    p shifted.map {|c| c.chr}.join
end

caeser_cipher("abcdefg", 3)