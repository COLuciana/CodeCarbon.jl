# CodeCarbon.jl
Unofficial Julia wrapper of the python library `codecarbon` for tracking emissions from Compute. 

[Python Documentation](https://mlco2.github.io/codecarbon/)
[Python GitHub](https://github.com/mlco2/codecarbon)

# Explicit Object

```julia
using CarbonCode
tracker = EmissionsTracker()
tracker.start()
# Compute intensive code goes here
tracker.stop()
```


# Do-Block Syntax

```julia
using CarbonCode

EmissionsTracker() do tracker
    tracker.start()
    # Compute intensive code goes here
    tracker.stop()
end
```

# Macro

```julia
using CodeCarbon
test_func() = sleep(2)
@track_emissions test_func() EmissionsTracker()
@track_emissions test_func() OfflineEmissionsTracker(country_iso_code="CAN")
```