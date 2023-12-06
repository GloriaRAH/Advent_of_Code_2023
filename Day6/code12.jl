# How many ways can you beat the record in this one much longer race?

Data = open("Day6/input11.txt") do file
    [split(line, ':')[2] |> strip for line in eachline(file)]
end

Time = parse(Int64, replace(Data[1], "     "=>""))
Distance = parse(Int64, replace(Data[2], "   "=>""))

record_beat = 0
for button=0:Time
    Time_remain = Time - button
    Dist = button * Time_remain
    if Dist < Distance
        Possible_win = 0
    else
        Possible_win = 1
    end
    global record_beat = record_beat + Possible_win
end
record_beat