
# @Dev

f <- "C:\\Users\\igayen\\Downloads\\chk.txt"

sink(f)
print(Sys.getenv("IG_test2"))
cat("\n__\n")
print(Sys.getenv("IG_test3"))
cat("\n___\n")
print(Sys.getenv("IG_test"))
print(Sys.getenv("IG"))
print(.libPaths())
# .libPaths("C:/Users/igayen/Documents/R/win-library/3.6")
# pkg <- devtools::as.package(".")
# print(pkg)
print(normalizePath("."))
print("covrChecks" %in% rownames(installed.packages()))
sink(NULL)

# @Dev END

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
