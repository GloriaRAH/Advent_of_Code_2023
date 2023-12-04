# Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
# Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
# Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
# Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
# Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
# Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
# In the above example, card 1 has five winning numbers (41, 48, 83, 86, and 17) 
# and eight numbers you have (83, 86, 6, 31, 17, 9, 48, and 53). 
# Of the numbers you have, four of them (48, 83, 17, and 86) are winning numbers! 
# That means card 1 is worth 8 points 
# (1 for the first match, then doubled three times for each of the three matches after the first).
# 1*2^n => 1 point first match, n: number of other match
# Card 2 has two winning numbers (32 and 61), so it is worth 2 points.
# Card 3 has two winning numbers (1 and 21), so it is worth 2 points.
# Card 4 has one winning number (84), so it is worth 1 point.
# Card 5 has no winning numbers, so it is worth no points.
# Card 6 has no winning numbers, so it is worth no points.
# So, in this example, the Elf's pile of scratchcards is worth 13 points.

# Take a seat in the large pile of colorful cards. How many points are they worth in total?

# Open the input file and take only valuable number
Wins, Yours = open("Day4/input7.txt") do file
    # Initialize an empty array to store the results
    results_Win = []
    results_You = []
    # Iterate through each line in the file
    for line in eachline(file)
        # Split the line by ":" and take the second part, then strip whitespace
        space_rm = replace(line, "  "=>" ")
        value = split(space_rm, ':')[2] |> strip
        Winning_Numbers = split(value, '|')[1] |> strip
        Your_Numbers = split(value, '|')[2] |> strip
        # Append the processed value to the results array
        push!(results_Win, Winning_Numbers)
        push!(results_You, Your_Numbers)
    end
    # Return the results array
    results_Win, results_You
end

# Separate numbers each other
splitted_Wins = []
splitted_Yours = []
for i=1:193
    push!(splitted_Wins, split(Wins[i],' '))
    push!(splitted_Yours, split(Yours[i],' '))
end

# Match Wins to Yours and return the numbers of matching
match_test_row_1 = []
count = 0
for k=1:193
    for i in eachindex(splitted_Wins[k])
        for j in eachindex(splitted_Yours[k])
            if splitted_Wins[k][i] == splitted_Yours[k][j]
                match_test_row = 1
            else
                continue
            end
            global count = count + match_test_row
        end
    end
    push!(match_test_row_1, count)
    global count = 0
end

# Point value for each card 
Total_point = 0
for i in eachindex(match_test_row_1)
    if match_test_row_1[i] == 0
        point = 0
    else
        point = 1*2^(match_test_row_1[i]-1)
    end
    global Total_point = Total_point + point
end
println("The total point of the cards is = ", Total_point)