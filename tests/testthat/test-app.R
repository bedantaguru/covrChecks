Sys.setenv(IG=getwd())
test_that("shiny works", {
  #stop("what is this")
  Sys.setenv(IG_test=normalizePath("."))
  shinytest::expect_pass(shinytest::testApp("testApp", compareImages = FALSE))
})
