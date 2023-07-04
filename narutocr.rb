NARUTO_ALPHABET = ['N', 'a', 'r', 'u', 't', 'o', 'I', 't', 'a', 'c', 'h', 'i', 'S', 'a', 's', 'u', 'k', 'e', 'B', 'o', 'r', 'u', 't', 'o', 'M', 'a', 'r', 'a', 'd', 'a', 'S', 'a', 'r', 'a', 'd', 'a', 'M', 'i', 't', 's', 'u', 'k', 'i', 'I', 'n', 'o', 'L', 'e', 'e', 'D', 'e', 'n', 'k', 'i', 'S', 'a', 'k', 'u', 'r', 'a', 'O', 'r', 'o', 'c', 'h', 'i', 'm', 'a', 'r', 'u']

def naruto_shinobi_cipher(text, shift)
  encrypted_text = ''

  text.chars.each do |char|
    if char.match?(/[A-Za-z]/)
      ascii_code = char.ord
      shifted_ascii_code = shift_character(ascii_code, shift)
      shifted_character = NARUTO_ALPHABET[shifted_ascii_code - 65]
    else
      shifted_character = char
    end

    encrypted_text << shifted_character
  end

  encrypted_text
end

def shift_character(ascii_code, shift)
  if ascii_code.between?(65, 90)  # Uppercase letters
    ((ascii_code - 65 + shift) % 26)
  elsif ascii_code.between?(97, 122)  # Lowercase letters
    ((ascii_code - 97 + shift) % 26)
  else
    ascii_code
  end
end

# Test the encryption
text = 'Leaf Village'
encrypted_text = naruto_shinobi_cipher(text, 4)
puts encrypted_text

text = 'Uchiha Clan'
encrypted_text = naruto_shinobi_cipher(text, 7)
puts encrypted_text

# Prompt the user for input
print "Enter the text to encrypt: "
text = gets.chomp

print "Enter the shift value: "
shift = gets.chomp.to_i

# Encrypt the user's input
encrypted_text = naruto_shinobi_cipher(text, shift)
puts "Encrypted text: #{encrypted_text}"
