## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {  ## set the value of the matrix
    x <<- y
    i <<- NULL
  }
  get <- function() x  ## get the value of the matrix
  setinverse <- function(inverse) i <<- inverse ## set the value of the inverse
  getinverse <- function() i  ## get the value of the matrix
  list(set = set, get = get,   ## return a list of function
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## cacheSolve: This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()   ## find if x in cache
  if(!is.null(i)) {   ## inverse found
    message("getting cached data")
    return(i) 
  }
  ## inverse not found, set the matrix value
  data <- x$get()
  ## calculate the inverse
  i <- solve(data, ...)
  ## set the inverse into cache
  x$setinverse(m)
  ## return inverse
  m
}