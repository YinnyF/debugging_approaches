def encode(plaintext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  ciphertext_chars = plaintext.chars.map do |char|
    (65 + cipher.find_index(char)).chr
  end
  ciphertext_chars.join
end

def decode(ciphertext, key)
  cipher = key.chars.uniq + (('a'...'z').to_a - key.chars)
  plaintext_chars = ciphertext.chars.map do |char|
    cipher[65 - char.ord]
  end
  plaintext_chars.join
end

# Intended output:
#
# > encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# => "EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL"
#
# > decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
# => "theswiftfoxjumpedoverthelazydog"

=begin
Explanation of the problem:
1.  I would first try to run the encode method from irb to see what it gives us:
    ```irb
    require './lib/exercise4.rb'
    encode("theswiftfoxjumpedoverthelazydog", "secretkey")
    ```
    This gives us a TypeError, and a stack trace starting on line 4 of the code which gives us the info:
    TypeError (nil can't be coerced into Integer)
2.  Why is there a TypeError? A good place to start is to get visibility on the error by using a few `puts` or `p` statements. 
    The clue from the error message is that nil can't be coerced into Integer. Is there anything we `puts`ed that gives nil? If you `puts cipher.find_index(char)`` inside the loop you will see nil returned, thus stopping the program. Why is this? If you also `puts char` to show which character it was that caused this issue, you will see that it was the character 'z'.
    Why might `cipher.find_index("z")` return nil? if you `puts cipher` you will see that there is no 'z' in the array, therefore, the index cannot be found. We can now see that the range ('a'...'z') should be ('a'..'z') to generate an inclusive range. 
3.  The same issue with inclusive ranges is present in the decode method. 
4.  If you try to run the decode method from irb, it will give you `"uixschlulaegtdyxmarxvuixfospmaj"`, this seems to have given you a string with no errors so perhaps its an issue with the code that is decrypting the plaintext string. 
    It should be the opposite of what we did for encode. What did we do for encode?
      We take the plaintext string.
      Iterate over each character in the string
      For each charcter, check which position it is in for the cipher array. 
      Add 65 to the index
      Then send it the message .chr on the integer 
      This gives a letter that forms part of a string.

      What is the reverse of this?
      Iterate over the string.
      Send the char the message .ord to reverse .chr.
      minus 65 to the index
      Look up that position in the cipher array and see what letter it gives. 
      all the letters should form the decoded string. 

      You can see on line 12 that instead, we tried to do 65 minus the index. Whereas it should be the index minus 65. 

      This should correct the bugs. 
=end