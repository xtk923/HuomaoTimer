using Pkg
Pkg.activate(joinpath(@__DIR__, ".."))

using HuomaoTimer
using Dates

HuomaoTimer.start_timer(endTime = DateTime(today()) + Hour(13))