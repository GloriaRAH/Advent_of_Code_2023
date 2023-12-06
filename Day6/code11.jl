# Determine the number of ways you could beat the record in each race. 
# What do you get if you multiply these numbers together?

using CSV, DataFrames
filename = "Day6/input11.txt"
data = CSV.read(filename, DataFrame, header=false, delim=' ', ignorerepeated=true)
Time = data[1,2:5]
Distance = data[2,2:5]
record_beat = 0
Win = []
for i in eachindex(Time)
    for button=0:Time[i]
        Time_remain = Time[i] - button
        Dist = button * Time_remain
        if Dist < Distance[i]
            Possible_win = 0
        else
            Possible_win = 1
        end
        global record_beat = record_beat + Possible_win
    end
    push!(Win, record_beat)
    global record_beat = 0
end
Win
prod(Win)