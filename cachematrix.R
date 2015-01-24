## makeCacheMatrix sets and gets the values of the matrix and inverse matrix.
## cacheSolve returns the inverse matrix.

## Creates a list containing functions to set and get the values
## of the matrix and inverse matrix

makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
     
     set <- function(y) {               # Sets the original matrix
          x <<- y
          m <<- NULL
     }
     
     get <- function(){                 # Gets the original matrix
          x
     }
     
     setInverse <- function(solve){     # Sets the inverse matrix
          m <<- solve
     }
     
     getInverse <- function(){          # Gets the inverse matrix
          m
     }
     
     list(set = set, get = get, 
          setInverse = setInverse, 
          getInverse = getInverse)
}


## Returns the value of the inverse matrix from cache if available, otherwise
## calculates the inverse matrix and returns it

cacheSolve <- function(x, ...) {
     m <- x$getInverse()
     
     if (!is.null(m)) {                           # Checks to see if the inverse
          message("Getting cached data...")       # is available in the cache
          return(m)                          # Returns inverse if available
     }
     
     data <- x$get()                         # Sets data = original matrix
     m <- source(data, ...)                  # source() gets inverse
     x$setInverse(m)                         # Sets inverse of data = m
     m                                       # Returns inverse m
}
