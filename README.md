# CodeCarbon.jl
Unofficial Julia wrapper of the Python library `codecarbon` for tracking emissions from compute. 

[Python Documentation](https://mlco2.github.io/codecarbon/)  

[Python GitHub](https://github.com/mlco2/codecarbon)  

## Explicit Object

```julia
using CodeCarbon
tracker = EmissionsTracker()
tracker.start()
# Compute intensive code goes here
tracker.stop()
```

## Do-Block Syntax

```julia
using CodeCarbon

EmissionsTracker() do tracker
    tracker.start()
    # Compute intensive code goes here
    tracker.stop()
end
```

## Macro

```julia
using CodeCarbon
test_func() = sleep(2)
@track_emissions test_func() EmissionsTracker()
@track_emissions test_func() OfflineEmissionsTracker(country_iso_code="CAN")
```

## Visualization

```julia
using CodeCarbon
run_carbonboard("./emissions.csv", port=3333)
```
