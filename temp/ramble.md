## IMPLEMENTING CAESAR CIPHER!

### First thoughts
- The entire point of this program is to have a single function call encrypt a string:
  caesar_cipher("What a string!", 5)
  => "Bmfy f xywnsl!"

- The easiest way to implement this is to join all the characters in an array, join all the alphabets in an array, then iterate over the encryptee?? array and shift each letter using the alphabet array index as a reference.

### Iterate over both arrays
- Just use #each to iterate over input_arr first, then #each_with_index for alphabet_arr.

- If the current value for input_arr and alphabet_arr are the same, use the current index of alphabet_arr for shifting

### Going back to thje begginnig of an array
- No matter the shift_number, we still need to account for what happens if we need to loop back to the beginning of the alphabet_array.

- alphabet_index + shift_number can equals to full_index

- full_index / 26 (rounded down) will give your the number of times you need to "reset"

- Make a loop that uses the "reset number" as the loop stop condition. start at i = 0 and keep adding 1

- When alphabet_index is greater than 26, set i back to 0. Keep adding one

- When the loop is done you can then use i as the proper alphabet_index



i = -1dfgfg