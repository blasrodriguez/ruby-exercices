def substrings original_string, dictionary
  original_string = original_string.downcase
  dictionary.reduce({}) do |subtrings_hash, substring|
    if original_string.include? substring
      subtrings_hash.update(substring => original_string.scan(/(?=#{substring})/).count)
    else
      subtrings_hash = subtrings_hash
    end
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
