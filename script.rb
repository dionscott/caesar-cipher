# an array of letters
ALPHABET = ("a".."z").to_a

def caesar_cipher(string, number = 0)
  p string
  string_array = string.split("")
  new_string = []
  string.length.times do 
    character = string_array.shift
    new_character = transform_character(character, number)
    new_string << new_character
  end
  p new_string.join("")
end

def transform_character(character, number)
  #check if letter is upcase if so downcase it increment and upcase
  if uppercase?(character)
    #downcase the letter to match to ALPHABET
    lowercase = character.downcase
    #find index of alphabet
    index = alphabet_index(lowercase)
    new_index = increment(index, number)
    #find new index after increment and upcase
    character = ALPHABET[new_index].upcase
    #return character
    character

  #check if in alphabet if it is shift 
  elsif in_alphabet?(character)
    #finds index of alphabet
    index = alphabet_index(character)
    #increment number based on given amount
    new_index = increment(index, number)
    #find new character
    character = ALPHABET[new_index]
    #return character
    character

  #if downcase increment and change
  else
    #if the character is not found in ALPHABET return character
    character
  end
end

#checks if letter is uppercase
def uppercase?(letter)
  if letter == letter.downcase
    false
  else
    true
  end
end

#check if matches alphabet case sensitive
def in_alphabet?(letter)
  if ALPHABET.find_index(letter)
    true
  else
    false
  end
end

def alphabet_index(letter)
  ALPHABET.find_index(letter)
end

def increment(number, amount)
  #if number reaches 25 restart count to 0
  amount.times do
    if number == 25
      number = 0
    else
      number += 1
    end
  end
  number
end


caesar_cipher("Hey there!", 5)
caesar_cipher("Good Day, friends and family! You're #1!", 1)
caesar_cipher("y", 5)