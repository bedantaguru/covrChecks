


normal_fun <- function(x = 10){
  x+10
}


proto_fun <- function(x){
  function(){
    paste0("This is a proto text: ", x)
  }
}

run_time_function <- function(){
  f0 <- proto_fun("Sample")
  f1 <- proto_fun("Another Sample")

  f_call(f0, f1, normal_fun)
}

f_call <- function(...){
  l <- list(...)
  if(length(l)>0){
    l %>%
      lapply(function(.x){
        .x()
      }) %>%
      unlist() %>%
      paste0(collapse = "\n") %>%
      cat()
  }
}
