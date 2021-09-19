# using Revise for auto-updating packages/functions
try
    using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end
