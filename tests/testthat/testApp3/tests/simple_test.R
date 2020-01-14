
#app <- ShinyDriver$new("../", loadTimeout = 30000)
app <- ShinyDriver$new("../")
app$snapshotInit("simple_test")

app$snapshot()
app$setInputs(test2 = 800)
app$snapshot()
app$setInputs(test2 = 17)
app$snapshot()


source("../../testlib/shiny_after_test_routines.R")
shiny_after_test_routines(app)
