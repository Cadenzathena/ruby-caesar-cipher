def caesar_cipher(input, shift_number)

  alphabet_arr = "abcdefghijklmnopqrstuvwxyz".split("")
  input_arr = input.split("")
  encrypted_arr = Array.new

  input_arr.each do |input_item|
    alphabet_arr.each_with_index do |alphabet_item, alphabet_index|

      alphabet_wrap_number = ((alphabet_index + shift_number) / 26).floor
      input_item_is_alphabet = alphabet_arr.include?(input_item.downcase)

      if input_item_is_alphabet && input_item.downcase != alphabet_item
        next

      elsif !input_item_is_alphabet && input_item.downcase != alphabet_item
        encrypted_arr.push(input_item)
        break

      elsif alphabet_wrap_number > 0 && input_item_is_alphabet
        i = 0
        alphabet_wrap_number.times do
          if i > 26
            i = 0
          end
          i =+ 1
        end
        encrypted_arr.push(alphabet_arr[i])

      elsif alphabet_wrap_number <= 0 && input_item_is_alphabet
        encrypted_arr.push(alphabet_arr[alphabet_index + shift_number])
      end

    end
  end
  
  encrypted_text = encrypted_arr.join("")
  puts encrypted_text
end

caesar_cipher("What a string!", 5)