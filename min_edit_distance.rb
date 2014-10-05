# Minimum Edit Distance
# Implementation of Figure 3.25 from Jurafsky & Martin
# Jason J
# 3 October 2014

# Test Cases:
# L("intention", "execution") = 8
# L("Saturday", "Sunday") = ?
# L("islander", "slander") = 1

def min_edit_distance(target, source)
  n = target.length
  m = source.length
  
  # Print the lengths of the strings.
  # puts "n = #{n}"
  # puts "m = #{m}"
  
  # Create a (n+1) by (m+1) table for the distance.
  distance = Array.new(n + 1) { Array.new(m + 1, 0) }
  
  # Create a (n+1) by (m+1) table for the backtrace.
  backtrace = Array.new(n + 1) { Array.new(m + 1, 0) }
  
  # Print the empty table.
  # distance.each { |row| puts "#{row}" }
  
  # Initialize the table.
  for i in 1..n
    distance[i][0] = distance[i - 1][0] + 1
  end
  
  for j in 1..m
    distance[0][j] = distance[0][j - 1] + 1
  end
  
  # Print the initialized table.
  # distance.each { |row| puts "#{row}" }
  
  # Fill the table.
  for i in 1..n
    for j in 1..m
      # Make an array to hold the three possibilities.
      possibilities = Array.new(3, 0)
      
      possibilities[0] = distance[i - 1][j] + 1
      # Use Levenshtein distance.
      possibilities[1] = distance[i - 1][j - 1] + (target[i - 1] == source[j - 1] ? 0 : 2)
      possibilities[2] = distance[i][j - 1] + 1
      
      # Take the minimum of the possibilities.
      distance[i][j] = possibilities.min
    end
  end
  
  # puts "\n"
  # Print the filled table.
  # distance.each { |row| puts "#{row}" }
  
  return distance[n][m]
end

puts "Enter target string:"
target = gets.chomp

puts "Enter source string:"
source = gets.chomp

puts "Minimum Edit Distance: #{min_edit_distance(target, source)}"
