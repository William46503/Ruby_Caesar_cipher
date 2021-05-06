class Encryptor

  def process_encrypt(message, shift_value)
      # Convert the message to a letter array
      #for each letter in the letter array, get the char-code
      letterArray = message.chars.map {|letter| letter.ord}

      #check if its uppercased, lowercased, or not a letter and encrypt it
      encryptedCharCodes = letterArray.map do |item|
          if item.between?(65, 90)
              # to wrap z to a, subtract ASCII character code with the base of ASCII-starting line, to make the value is between 0-25 (until 25 is fine, cause it starts from 0), after replacing it between 0-25, add back the base to convert it back to ASCII-code
              # Restrict Number to Range using Modulo (result in a circular array): the range of x % n is between 0 and n - 1, which is to say that the modulo operation will not return more than the divisor
              (((item - 65) + shift_value) % 26) + 65
          elsif item.between?(97, 122)
              (((item - 97) + shift_value) % 26) + 97
          else
              #If its not a letter, just return what it is
               item
          end
      end

      #rejoin the whole new encryped array of char-code
      encryptedString = encryptedCharCodes.map{|item| item.chr}.join("")

     p encryptedString
  end
end

Encryption = Encryptor.new

p "test case"
Encryption.process_encrypt("What a string!", 5);

p "Whats the message to encrypt?"
input_message = gets.chomp
p "How much shift"
input_shift = gets.chomp.to_i
Encryption.process_encrypt(input_message, input_shift)