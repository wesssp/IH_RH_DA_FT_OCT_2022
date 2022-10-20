

# numpy exercises

This is a collection of exercises that have been collected in the numpy mailing list, on stack overflow
and in the numpy documentation. The goal of this collection is to offer a quick reference for both old
and new users but also to provide a set of exercises for those who teach.


If you find an error or think you've a better way to solve some of them, feel
free to open an issue at <https://github.com/rougier/numpy-100>.
File automatically generated. See the documentation to update questions/answers/hints programmatically.

#### 1. Import the numpy package under the name `np` (★☆☆)
`hint: import … as`
import numpy as np

#### 2. Create a null vector of size 10 (★☆☆)
`hint: np.zeros`
return np.zeros((3), dtype=int))


#### 3. Create a null vector of size 10 but the fifth value which is 1 (★☆☆)
`hint: array[4]`

array = np.zeros((10), dtype=int)
array[4] = 1
array

#### 4. Create a vector with values ranging from 10 to 49 (★☆☆)
`hint: arange`
np.arange(10, 50)

#### 5. Create a 3x3 matrix with values ranging from 0 to 8 (★☆☆)
`hint: reshape`
np.arange(9).reshape(3,3)

#### 6. Find indices of non-zero elements from [1,2,0,0,4,0] (★☆☆)
`hint: np.nonzero`
??

#### 7. Create a 3x3 identity matrix (★☆☆)
`hint: np.eye`
np.eye(3,3)

#### 8. Create a 3x3x3 array with random values (★☆☆)
`hint: np.random.random`
array = np.random.random((3,3))

#### 9. Create a 10x10 array with random values and find the minimum and maximum values (★☆☆)
`hint: min, max`
array = np.random.random((10,10))
np.min(array)
np.max(array)

#### 10. Create a random vector of size 30 and find the mean value (★☆☆)
`hint: mean`
np.mean(np.arange(30))

#### 11. Create a 5x5 matrix with values 1,2,3,4 just below the diagonal (★☆☆)
`hint: np.diag`
np.diag((1,2,3,4), -1)

#### 12. Normalize a 5x5 random matrix (★☆☆)
`hint: (x -mean)/std`
array = np.random.random((5,5))
new_array = (array - np.mean(array)) / np.std(array)

#### 13. How to find common values between two arrays? (★☆☆)
`hint: np.intersect1d`
ar1 = np.arange(10)
ar2 = np.arange(5,15)
np.intersect1d(ar1, ar2)

#### 14. Create a random vector of size 10 and sort it (★★☆)
`hint: sort`
sorted(np.random.random((10)))

#### 15. Create random vector of size 10 and replace the maximum value by 0 (★★☆)
`hint: argmax`
x = np.random.random(10)
x[np.argmax(x)] = 0

#### 16. Subtract the mean of each row of a matrix (★★☆)
`hint: mean(axis=,keepdims=)`

x = np.random.random((5,5))
y = np.subtract(x, np.mean(np.sum(x, axis=1)))

#### 17. How to get the n largest values of an array (★★★)
`Z = np.arange(10000)
np.random.shuffle(Z)
n = 5
hint: np.argsort | np.argpartition`
Z = np.arange(10000)
np.random.shuffle(Z)
n = 5
q = np.argpartition(Z[np.argsort(Z)], 5)
q[- n :]

#### 18. Create a random 5*3 matrix and replace items that are larger than 4 by their squares ( Example:  6 --> 36) 
`hint: np.where`
x = np.random.randint(99, size=(5, 3))
np.where(x < 4, x, x**2)