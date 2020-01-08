test_that("shiny works", {
  shinytest::expect_pass(shinytest::testApp("testApp", compareImages = FALSE))
})
