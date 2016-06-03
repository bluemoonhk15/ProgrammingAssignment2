## Put comments here that give an overall description of what your
## functions do

## Create a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(n) {
        m <<- n
        inv <<- NULL
    }
    get <- function() {m}
    setSolve <- function(s) {inv <<- s}
    getSolve <- function() {inv}
    list(set = set,
         get = get,
         setSolve = setSolve,
         getSolve = getSolve)
}

## Return a matrix that is the inverse of 'm'
cacheSolve <- function(m, ...) {
    inv <- m$getSolve()
    if(is.null(inv)){
        matrix <- m$get()
        print("compute inverse matrix")
        inv <- solve(matrix)
        m$setSolve(inv)
    }
    inv
}
