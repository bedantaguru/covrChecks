

lets_create_this_pkg <- function(){
  # these lines should not be covered
  if(requireNamespace("usethis", quietly = TRUE)){
    usethis::use_description()
    usethis::use_mit_license()

    usethis::use_github()
    usethis::use_travis()
    usethis::use_coverage()

    usethis::use_namespace()
    usethis::use_roxygen_md()

    usethis::use_pipe()
    usethis::use_readme_md()
    usethis::use_dev_version()

    usethis::use_testthat()
    usethis::use_test("run_time_function")
    usethis::use_test("app")

    usethis::use_package("usethis", type = "Suggests")
    usethis::use_package("shinytest", type = "Suggests")
    usethis::use_package("shiny", type = "Suggests")

  }
}
