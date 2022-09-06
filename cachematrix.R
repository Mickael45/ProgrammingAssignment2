## Put comments here that give an overall description of what your
## functions do

## Provides set of functions that allows the user to:
## 1) Get the cached inversed matrix
## 2) Set the cached inversed matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  getOriginalMatrix <- function() x
  setInverse <- function(inv) m <<- inv
  getInverse <- function() m
  list(getOriginalMatrix = getOriginalMatrix,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$getOriginalMatrix()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}
