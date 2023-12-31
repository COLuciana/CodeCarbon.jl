module CodeCarbon

using PythonCall

const codecarbon = PythonCall.pynew() 
const EmissionsTracker = PythonCall.pynew()
const OfflineEmissionsTracker = PythonCall.pynew()

function __init__()
    PythonCall.pycopy!(codecarbon, pyimport("codecarbon"))
    PythonCall.pycopy!(EmissionsTracker, pyimport("codecarbon" => "EmissionsTracker"))
    PythonCall.pycopy!(OfflineEmissionsTracker, pyimport("codecarbon" => "OfflineEmissionsTracker"))
end

macro track_emissions(expr, tracker_expr=EmissionsTracker())
    quote
        tracker=$(esc(tracker_expr))
        tracker.start()
        try
            $(esc(expr))
        catch e
            tracker.stop()
            rethrow(e)
        finally
            return tracker.stop()
        end
    end
end

function run_carbonboard(filepath::String; port::Int=3333)
    command = `carbonboard --filepath=$filepath --port=$port`
    run(pipeline(command, stdout=IOBuffer()))
end

export 
codecarbon,
EmissionsTracker,
OfflineEmissionsTracker,
@track_emissions,
run_carbonboard

end # module CodeCarbon
