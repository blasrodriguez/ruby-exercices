def caesar_cipher (message, shift=3)
  cyphered_message = message.split('').map do | char |
    if char =~ /[[:alpha:]]/
      shift_chart char, shift
    else
      char 
    end
  end
  p cyphered_message.join
end

def shift_chart char, shift
  #if /[[:upper:]]/.match(char)
  if char =~ /[[:upper:]]/
    (((char.ord-"A".ord+shift)%26)+"A".ord).chr
  else
    (((char.ord-"a".ord+shift)%26)+"a".ord).chr
  end
end
caesar_cipher("What a string!", 5)
