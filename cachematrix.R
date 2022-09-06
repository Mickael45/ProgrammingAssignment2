## Put comments here that give an overall description of what your
## functions do

## Provides set of functions that allows the user to:
## 1) Get the cached inversed matrix
## 2) Set the cached inversed matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  setmean <- function(inv) m <<- inv
  getmean <- function() m
  list(get = get,
       setmean = setmean,
       getmean = getmean)
}


## Returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
  m <- x$getmean()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmean(m)
  m
}
