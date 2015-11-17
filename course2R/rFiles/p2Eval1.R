# assumed that the input is a square matrix that has an inverse
# otherwise error will be thrown: Error in solve.default(data) : 'a' (m x n) must be square  
makeCacheMatrix <- function(x= matrix()) {
      # initializes the inv property when makeCacheMatrix is 1st initialized
      inv <- NULL
      # the setter method to override the input matix passed in during initialization
      set <- function(y) {
            # <<- means to modify a variable in the parent environment
            x <<- y
            inv <<- NULL
      }
      # getter method
      get <- function() x
      # sets the inverse in the parent environment
      setInv <- function(inverse) inv <<- inverse
      
      # getter for inverse
      getInv <- function() inv
      
      # returns list of functions
      list(set = set, get = get,
           setInv = setInv,
           getInv = getInv)
}

cacheSolve <- function(x, ...) {
      
      ## Return a matrix that is the inverse of 'x'
      m <- x$getInverse()
      
      ## Just return the inverse if its already set
      if( !is.null(m) ) {
            message("getting cached data")
            return(m)
      }
      
      ## Get the matrix from our object
      data <- x$get()
      
      ## Calculate the inverse using matrix multiplication
      m <- solve(data) %*% data
      
      ## Set the inverse to the object
      x$setInverse(m)
      
      ## Return the matrix
      m
}