file = File.open("INPUT.txt")
words = file.read
file.close
words_array = words.split(' ')

#create arrays of the mispelled words
wrong_word_1 = words_array[1]
wrong_word_2 = words_array[4]
wrong_word_3 = words_array[7]
wrong_word_4 = words_array[10]
wrong_word_5 = words_array[13]
wrong_word_6 = words_array[16]
wrong_word_7 = words_array[19]
wrong_word_8 = words_array[22]
wrong_word_9 = words_array[25]
wrong_word_10 = words_array[28]

#create arrays of word suggestions
suggestion_word1 = words_array[2..3]
suggestion_word2 = words_array[5..6]
suggestion_word3 = words_array[8..9]
suggestion_word4 = words_array[11..12]
suggestion_word5 = words_array[14..15]
suggestion_word6 = words_array[17..18]
suggestion_word7 = words_array[20..21]
suggestion_word8 = words_array[23..24]
suggestion_word9 = words_array[26..27]
suggestion_word10 = words_array[29..30]


#creating arrays of each word's letters
mistake1 = wrong_word_1.split(//)
sug1 = suggestion_word1[0].split(//)
sug1_1 = suggestion_word1[1].split(//)
mistake2 = wrong_word_2.split(//)
sug2 = suggestion_word2[0].split(//)
sug2_1 = suggestion_word2[1].split(//)
mistake3 = wrong_word_1.split(//)
sug3 = suggestion_word3[0].split(//)
sug3_1 = suggestion_word3[1].split(//)
mistake4 = wrong_word_1.split(//)
sug4 = suggestion_word4[0].split(//)
sug4_1 = suggestion_word4[1].split(//)
mistake5 = wrong_word_1.split(//)
sug5 = suggestion_word5[0].split(//)
sug5_1 = suggestion_word5[1].split(//)
mistake6 = wrong_word_1.split(//)
sug6 = suggestion_word6[0].split(//)
sug6_1 = suggestion_word6[1].split(//)
mistake7 = wrong_word_1.split(//)
sug7 = suggestion_word7[0].split(//)
sug7_1 = suggestion_word7[1].split(//)
mistake8 = wrong_word_1.split(//)
sug8 = suggestion_word8[0].split(//)
sug8_1 = suggestion_word8[1].split(//)
mistake9 = wrong_word_1.split(//)
sug9 = suggestion_word9[0].split(//)
sug9_1 = suggestion_word9[1].split(//)
mistake10 = wrong_word_1.split(//)
sug10 = suggestion_word10[0].split(//)
sug10_1 = suggestion_word10[1].split(//)


#counting the letters in the array
mistake_count1 = mistake1.count
mistakke_count2 = mistake2.count
suggestion1_count = sug1.count
suggestion2_count = sug2.count


#LCS Calculator
  def longest_common_subsequence(string1, string2)
    cols = string1.length + 1
    rows = string2.length + 1
    table = rows.times.collect { Array.new(cols, 0) }
    (1..(cols-1)).each do |col|
      (1..(rows-1)).each do |row|
        if string1[col-1] == string2[row-1]
          table[row][col] = table[row-1][col-1] + 1
        else
          table[row][col] = [table[row][col-1], table[row-1][col]].max
        end
      end
    end
    table[rows-1][cols-1]
  end


#array to store the output file
word_store = []


#running all the words and the spelling suggestions
apple = longest_common_subsequence(mistake1, sug1)
pear = longest_common_subsequence(mistake1, sug1_1)
if apple > pear
  word_store << suggestion_word1[0]
else
  word_store << suggestion_word1[1]
end

orange = longest_common_subsequence(mistake2, sug2)
tangeringe = longest_common_subsequence(mistake2, sug2_1)
if orange > tangeringe
  word_store << suggestion_word2[0]
else 
  word_store << suggestion_word2[1]
end

c = longest_common_subsequence(mistake1, sug1)
d = longest_common_subsequence(mistake1, sug1_1)
if c < d
  word_store << suggestion_word3[0]
else
  word_store << suggestion_word3[1]
end

e = longest_common_subsequence(mistake1, sug1)
f = longest_common_subsequence(mistake1, sug1_1)
if e < f
  word_store << suggestion_word4[0]
else
  word_store << suggestion_word4[1]
end

g = longest_common_subsequence(mistake1, sug1)
h = longest_common_subsequence(mistake1, sug1_1)
if g < h
  word_store << suggestion_word5[0]
else
  word_store << suggestion_word5[1]
end

ips = longest_common_subsequence(mistake1, sug1)
ipst = longest_common_subsequence(mistake1, sug1_1)
if ips > ipst
  word_store << suggestion_word6[0]
else
  word_store << suggestion_word6[1]
end

k = longest_common_subsequence(mistake1, sug1)
l = longest_common_subsequence(mistake1, sug1_1)
if k < l
  word_store << suggestion_word7[0]
else
  word_store << suggestion_word7[1]
end

m = longest_common_subsequence(mistake1, sug1)
n = longest_common_subsequence(mistake1, sug1_1)
if m < n
  word_store << suggestion_word8[0]
else
  word_store << suggestion_word8[1]
end

o = longest_common_subsequence(mistake1, sug1)
oo = longest_common_subsequence(mistake1, sug1_1)
if o < oo
  word_store << suggestion_word9[0]
else
  word_store << suggestion_word9[1]
end

q = longest_common_subsequence(mistake1, sug1)
qq = longest_common_subsequence(mistake1, sug1_1)
if q < qq
  word_store << suggestion_word10[0]
else
  word_store << suggestion_word10[1]
end

puts word_store

file = File.open("sample_output_233.txt", 'w')  
(1..words_array[0].to_i).each do |word_extract|
  file.puts (word_store[word_extract - 1])
end
file.close
