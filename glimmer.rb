# Right shift caesar cipher method!
def caesar_cipher(input, shift_number)

  alphabet_arr = "abcdefghijklmnopqrstuvwxyz".split("")
  input_arr = input.split("")
  encrypted_arr = Array.new

  input_arr.each do |input_item|
    alphabet_arr.each_with_index do |alphabet_item, alphabet_index|

      # alphabet_wrap_number is for determining how many times to loop alphabet_arr
      # if alphabet_index + shift_number is higher than 26
      alphabet_wrap_number = ((alphabet_index + shift_number) / 26).floor
      input_item_is_alphabet = alphabet_arr.include?(input_item.downcase)
      input_item_is_upcase = input_item == alphabet_item.upcase

      # The break statements help stop the current alphabet_arr iteration once
      # a condition is met. No unecessary processes!
      if input_item_is_alphabet && input_item.downcase != alphabet_item
        next

      elsif !input_item_is_alphabet && input_item.downcase != alphabet_item
        encrypted_arr.push(input_item)
        break

      # Do we need to wrap/loop over the alphabet array? No? Then check for capitalization,
      # perform the caesar shift and push value to encrypted_arr
      elsif alphabet_wrap_number <= 0 && input_item_is_alphabet
        input_item_is_upcase ? encrypted_arr.push(alphabet_arr[alphabet_index + shift_number].upcase) :
        encrypted_arr.push(alphabet_arr[alphabet_index + shift_number])
        break

      # Do we need to wrap/loop over the alphabet array? Yes? Utilize alphabet_wrap_number in
      # a loop to determine the correct shift value. Capitalization check after
      elsif alphabet_wrap_number > 0 && input_item_is_alphabet
        i = 0
        alphabet_wrap_number.times do
          if i > 26
            i = 0
          end
          i += 1
        end
        input_item_is_upcase ? encrypted_arr.push(alphabet_arr[i].upcase) :
        encrypted_arr.push(alphabet_arr[i])
        break
      end

    end
  end
  
  encrypted_text = encrypted_arr.join("")
  puts encrypted_text
  encrypted_text
end

caesar_cipher("ZZZZZZZZZ", 1)