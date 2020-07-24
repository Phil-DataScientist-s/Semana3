##makeCacheMatrix:
##This function creates a special “matrix” object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()){
        m <- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        get <- function()x
        setresolver <- function(solve) m <<- solve
        getresolver <- function() m
        list(set = set,
             get = get,
             setresolver = setresolver,
             getresolver = getresolver)
}

##cacheSolve:
##This function computes the inverse of the special “matrix” returned by makeCacheMatrix above.
##If the inverse has already been calculated (and the matrix has not changed),
##then the cacheSolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...){
        m <- x$getresolver()
        if(!is.null(m)) {
                message("obtener datos en caché")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setresolver(m)
        m
        
}
