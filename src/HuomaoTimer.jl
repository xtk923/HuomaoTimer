module HuomaoTimer

using ProgressMeter
using Dates

defaultTime = DateTime(today()) + Hour(18) + Minute(30)



function start_timer(;endTime::DateTime = defaultTime)

    n = Dates.value(endTime - now())

    prog = Progress(n)

    while now() <= endTime
        c = n - Dates.value(endTime - now())
        update!(prog, c)
    end
end




end # module
