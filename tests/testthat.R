library(testthat)
library(covrChecks)


Sys.setenv(IG_test2 = getwd())
Sys.setenv(IG_test3 = paste0(.libPaths(), collapse = "\n"))

test_check("covrChecks")
