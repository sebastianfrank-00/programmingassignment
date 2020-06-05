## These functions create matrices that can be returned inversely 

## This function creates a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get  <- function() x
        setinverse <- function(inverse) m <<- inverse 
        getinverse <- function() m
        list(set = set, get = get)
              setinverse = setinverse
              getinverse = getinverse
}


## This function returns the inverse of the function supplied in makeCacheMatrix 

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message('getting cached data')
                return(m)
        }
        data1 <- x$get()
        m <- solve(data1)
        x$setinverse(m)
        m
}
