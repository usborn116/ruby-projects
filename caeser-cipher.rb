def caeser_cipher(string, shift)
    ascii = string.chars.map{|c| c.ord}
    letter = ascii.map{|n| (n >= 97 && n <= 122) || (n >=65 && n<=90)? n : n.chr}
    wrap = letter.map{|n| n.is_a?(Numeric) ? n + shift : n}
    final = wrap.map{|n| n.is_a?(Numeric) && n > 122 || (n.is_a?(Numeric) && n > 90 && n < 97) ? n - 26 : n}
    p final.map{|c| c.chr}.join('')
end

caeser_cipher("This is a great program!", 8)