#app <- ShinyDriver$new("../", loadTimeout = 30000)
app <- ShinyDriver$new("../")
app$snapshotInit("simple_test")

app$snapshot()
app$setInputs(n = 80)
app$snapshot()
app$setInputs(n = 7)
app$snapshot()

## Interrupt shinyProcess so covr::save_trace can execute onExit
p <- app$.__enclos_env__$private$shinyProcess
p$interrupt()
p$wait()
