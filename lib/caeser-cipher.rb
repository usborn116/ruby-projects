#input a string and a shift, and a new encoded string will be output

class Caesar
  Lower = 'abcdefghijklmnopqrstuvwxyz'.split('').freeze
  Upper = 'abcdefghijklmnopqrstuvwxyz'.upcase.split('').freeze
  def caeser_cipher(string, shift)
    string.split('').each_with_index do |letter, i| 
      if Lower.include?(letter)
        string[i] = Lower[return_index(Lower, letter, shift)]
      elsif Upper.include?(letter)
        string[i] = Upper[return_index(Upper, letter, shift)]
      end
    end
    p string
  end

  def return_index(arr, letter, shift)
    newletter_index = arr.index(letter) + shift
    newletter_index > 25 ? newletter_index - 26 : newletter_index
  end
end

Caesar.new.caeser_cipher('What a string!', 5)