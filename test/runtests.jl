
using Aqua
using CodeCarbon
using Test

@testset "Explicit Objects" begin
    tracker = EmissionsTracker()
    tracker.start()
    sleep(0.5)
    tracker.stop()

    tracker = OfflineEmissionsTracker(country_iso_code="USA")
    tracker.start()
    sleep(0.5)
    tracker.stop()
end

@testset "Macro" begin
    @track_emissions sleep(0.5) EmissionsTracker()
    @track_emissions sleep(0.5) OfflineEmissionsTracker(country_iso_code="USA")
end

Aqua.test_all(CodeCarbon; ambiguities=false)
