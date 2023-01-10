
romanToInt <- function(s) {
  mappings <- list(
    I = 1,
    V = 5,
    X = 10,
    L = 50,
    C = 100,
    D = 500,
    M = 1000
  )
  result <- 0
  for (i in 1:nchar(s)) {
    if (i+1 < nchar(s) && mappings[[s[i]]] < mappings[[s[i + 1]]]) {
      result <- result - mappings[[s[i]]]
    } else {
      result <- result + mappings[[s[i]]]
    }
  }
  return(result)
}