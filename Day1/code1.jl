# The newly-improved calibration document consists of lines of text; 
# each line originally contained a specific calibration value that the Elves now need to recover. 
# On each line, the calibration value can be found 
# by combining the first digit and the last digit (in that order) to form a single two-digit number.
# Consider your entire calibration document. What is the sum of all of the calibration values?

# Read the input file
a = open("Day1/input1.txt") do f
    readlines(f)
end

# Collecting all the digits for each line
All_digit = [filter(isdigit, collect(s)) for s in a]
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