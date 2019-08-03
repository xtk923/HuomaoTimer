module HuomaoTimer

using ProgressMeter
using Dates

export start_timer

if Dates.isfriday(today())
    defaultTime = DateTime(today()) + Hour(18)
else
    defaultTime = DateTime(today()) + Hour(18) + Minute(30)
end



function start_timer(;endTime::DateTime = defaultTime)

    n = Dates.value(endTime - now())
    prog = Progress(n, 0.1, "", 25)

    t_reset = @task readavailable(stdin)
    schedule(t_reset)
    yield()

    while now() <= endTime
        sleep(0.1)
        c = n - Dates.value(endTime - now())
        if istaskdone(t_reset)
            n = Dates.value(endTime - now())
            prog = Progress(n, 0.1, "", 25)

            t_reset = @task readavailable(stdin)
            schedule(t_reset)
            yield()
	    end

        update!(prog, c)

	end
    finish!(prog)
    println("\n\n Unleash Huomao! |･ω･｀)")
end




end # module
