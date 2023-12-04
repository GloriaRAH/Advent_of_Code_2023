# Determine which games would have been possible if the bag had been loaded 
# with only 12 red cubes, 13 green cubes, and 14 blue cubes. 
# What is the sum of the IDs of those games?

# Read the input file
games = open("Day2/input3.txt") do file
    # Splitting the file
    [split(line, ':')[2] |> strip for line in eachline(file)]
end

# Maximum numbers of cubes making the game possible
CUBES = Dict("red"=>12, "green"=>13, "blue"=>14)

# Checking the game id and giving the final count
function check(game, id)
    draws = split(game, ';')
    for draw in draws
        cubes = split(draw, ',')
        for cube in cubes
            n, color = split(cube)
            if CUBES[color] < parse(Int, n)
                return 0
            end
        end
    end
    return id
end

count = 0
for (i, game) in enumerate(games)
    global count += check(game, i)
end
println("The sum of the IDs of those games is = ", count)