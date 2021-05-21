## This programming assignment deals with caching the Inverse of a Matrix.
## It contains two functions. The first function creates a special "matrix" 
## object that can cache its inverse and the second function computes the 
## inverse of the special "matrix" returned by the first function. If the 
## inverse has already been calculated (and the matrix has not changed), then 
## the second function should retrieve the inverse from the cache.


## The makeCacheMatrix function creates a special "matrix" object that can 
## cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        
        set <- function(y) {
            x <<- y
            inv <<- NULL
        }
        
        get <- function() {
            x  
        } 
        
        setInverse <- function(inverse) {
            inv <<- inverse  
        } 
        
        getInverse <- function() {
            inv  
        } 
        
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## The cacheSolve function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix function. If the inverse has already been 
## calculated (and the matrix has not changed), then the cachesolve should 
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
        
        if(!is.null(inv)) {
            message("getting cached data")
            return(inv)
        }
        
        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        
        inv    
}
