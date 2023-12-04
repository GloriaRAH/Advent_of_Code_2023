# In each game you played,
# what is the fewest number of cubes of each color 
# that could have been in the bag to make the game possible?

# The power of a set of cubes is equal to the numbers of red, green, and blue cubes multiplied together.

# Example
# Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green => 4R, 2G, 6B = 48
# Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue => 1R, 3G, 4B = 12
# Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red => 20R, 13G, 6B = 1560
# Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red => 14R, 3G, 15B = 630
# Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green => 6R, 3G, 2B = 36
# SUM = 48+12+1560+630+36 = 2286

# For each game, find the minimum set of cubes that must have been present. 
# What is the sum of the power of these sets?

# Read the input file
games = open("Day2/input4.txt") do file
    # Splitting the file
    [split(line, ':')[2] |> strip for line in eachline(file)]
end

# # Equivalence of the above in a multiple lines for loop
# games = open("Day2/input4.txt") do file
#     # Initialize an empty array to store the results
#     results = []
#     # Iterate through each line in the file
#     for line in eachline(file)
#         # Split the line by ":" and take the second part, then strip whitespace
#         value = split(line, ':')[2] |> strip
#         # Append the processed value to the results array
#         push!(results, value)
#     end
#     # Return the results array
#     results
# end

# # Equivalence of the above in a multiple lines for loop (From Fergus)
# file = open("Day2/input4.txt")
# lines = eachline(file)
# games = String[]
# for line in lines
#     game, rest = split(line, ":")
#     rest_without_spaces = strip(rest)
#     push!(games, rest)
# end

function check(game)
    cubes = Dict("red"=>0, "green"=>0, "blue"=>0)
    sets = split(game, ';')
    for elt in sets
        elts = split(elt,',')
        for cube in elts 
            n, color = split(strip(cube), " ") # |> strip
            cubes[color] = max(cubes[color], parse(Int, n)) 
        end
    end
    # Take the maximum number of each color for each line and multiply them together 
    return prod(values(cubes))
end

count = 0
for game in games
    global count += check(game)
end
println("The sum of the power of these sets is = ", count)