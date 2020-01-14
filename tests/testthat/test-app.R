
test_that("shiny works", {
  shinytest::expect_pass(shinytest::testApp("testApp", compareImages = FALSE))
  shinytest::expect_pass(shinytest::testApp("testApp3", compareImages = FALSE))
})
