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