## Put comments here that give an overall description of what your
## functions do

## creates the matrix, with setters and getter functions 

makeCacheMatrix <- function(x = matrix()) {
  print("makecachematrix start")
  i <- NULL
  set <- function(y){
    print("Setting")
    print(y)
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  print("makecachematrix finish")
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  #print("makecachematrix finish")
}

## solves/stores the matrix inverse 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  print("Cache start")
  i <- x$getinverse()
  if(!is.null(i)){
    print('got it from memory')
    return(i)
  }
  print("getting")
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  print("Cache finish")
  i
  
}

f <- rbind(c(1, -1/4), c(-1/4, 1))  
t <- makeCacheMatrix(f)
print(cacheSolve(t))

