## This 2 functions work together to get a matrix and computes its inverse.

## The function makeCacheMatrix creates a special "matrix", which has the
# intelligence to cache the inverse. this function contains the following Methods
#set the value of the Matrix
#get the value of the Matrix
#set the value of the mean
#get the value of the mean


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) 
   {
      x <<- y;
      m <<- NULL;
    }
  get <- function() return(x);
  setmean <- function(mean) m <<- mean;
  getmean<- function() return(m);
  return
  (
    list
      (
      set = set, 
      get = get, 
      setmean = setmean, 
      getmean = getmean
        )
    )
}


## This function works with the results returned by the makeCacheMatrix, where if the matrix
## was calculated and the it is still the same then cacheSolve will get the inverse. 


cacheSolve <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) 
        {
            message("Getting cached data")
            return(m)
        }
    data <- x$get()
    m <- solve(data)
    x$setmean(m)
  m
}
