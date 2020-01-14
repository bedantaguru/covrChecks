
test_that("shiny works", {
  shinytest::expect_pass(shinytest::testApp("testApp", compareImages = TRUE))
  shinytest::expect_pass(shinytest::testApp("testApp3", compareImages = TRUE))
})
