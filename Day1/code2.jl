# Your calculation isn't quite right. 
# It looks like some of the digits are actually spelled out with letters: 
# one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".
# Equipped with this new information, 
# you now need to find the real first and last digit on each line.
# What is the sum of all of the calibration values?

# Read the input file
a = open("Day1/input2.txt") do f
    readlines(f)
end
# Replace letters to numbers
b = []
for i in eachindex(a)
    a_change = replace(a[i], "one"=>"o1e", "two"=>"t2o", "three"=>"t3e", 
        "four"=> "f4r", "five"=>"f5e", "six"=>"s6x",
        "seven"=> "s7n", "eight"=>"e8t", "nine"=>"n9e")
    push!(b, a_change)
end
# Doing the replacement a second time to find possible remain letters that has been mixed together i.e. "eightwo"
c = []
for i in eachindex(b)
    b_change = replace(b[i], "one"=>"o1e", "two"=>"t2o", "three"=>"t3e", 
        "four"=> "f4r", "five"=>"f5e", "six"=>"s6x",
        "seven"=> "s7n", "eight"=>"e8t", "nine"=>"n9e")
    push!(c, b_change)
end

# Collecting all the digits for each line
All_digit = [filter(isdigit, collect(s)) for s in c]
Calb_sum = 0
for i in eachindex(All_digit)
    # Combining the first digit and the last digit
    if length(All_digit[i])>1
        Two_digit = All_digit[i][1]*All_digit[i][lastindex(All_digit[i])]
    else
        Two_digit = All_digit[i][1]*All_digit[i][1]
    end
    # Converting the string to Int64
    Two_digit = parse(Int64, Two_digit)
    # Calculating the calibration sum
    global Calb_sum = Calb_sum + Two_digit
end
println("The Sum of all calibrations values is = ", Calb_sum)