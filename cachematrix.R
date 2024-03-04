# Function to create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function() {
  # Initialize matrix and inverse variables
  mat <- NULL
  inv <- NULL
  
  # Function to set the matrix
  setMatrix <- function(matrix) {
    mat <<- matrix
    inv <<- NULL  ## myMatrix <- makeCacheMatrix()
    # myMatrix$setMatrix(matrix(c(1, 2, 3, 4), nrow = 2))
    # myMatrix$cacheSolve() Reset the cached inverse when the matrix changes
  }
  
  # Function to get the matrix
  getMatrix <- function() {
    mat
  }
  
  # Function to get the cached inverse or compute and cache the inverse
  cacheSolve <- function() {
    if (!is.null(inv)) {
      message("Getting cached inverse")
      return(inv)
    }
    
    message("Computing inverse and caching")
    
    # Calculate the inverse using the solve function
    inv <- solve(mat)
    
    # Cache the inverse
    inv <<- inv
    
    
    # Return the computed inverse
    inv
  }
  
  # Return a list of functions
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheSolve = cacheSolve)
}
