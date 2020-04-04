## Put comments here that give an overall description of what your
## functions do

## creates the matrix, with setters and getter functions 

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    print(y)
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  #print("makecachematrix finish")
}

## solves/stores the matrix inverse 
##Checks to see if inverse of that matrix is stored, if it is not, then we calculate it 
## if it is, we pull it from the cache 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)){
    return(i)
  }
  print("getting")
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
  
}

f <- rbind(c(1, -1/4), c(-1/4, 1))  
t <- makeCacheMatrix(f)
print(cacheSolve(t))

