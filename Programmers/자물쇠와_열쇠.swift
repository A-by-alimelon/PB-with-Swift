func rotateAMatrixBy90Degree(_ matrix: [[Int]]) -> [[Int]] {
    let n = matrix.count
    let m = matrix[0].count
    var result = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for i in 0..<n {
        for j in 0..<m {
            result[j][n-i-1] = matrix[i][j]
        }
    }
    return result
}

func check(_ newLock: [[Int]]) -> Bool {
    let length = newLock.count / 3
    for i in length..<length * 2{
        for j in length..<length * 2 {
            if newLock[i][j] != 1 {
                return false
            }
        }
    }
    return true
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let n = lock.count
    let m = key.count

    var newLock = Array(repeating: Array(repeating: 0, count: n * 3), count: n * 3)
    
    for i in 0..<n {
        for j in 0..<n {
            newLock[i + n][j + n] = lock[i][j]
        }
    }
    
    for _ in 0..<4 {
        key = rotateAMatrixBy90Degree(key)
        for x in 0..<n * 2 {
            for y in 0..<n * 2 {
                for i in 0..<m {
                    for j in 0..<m {
                        newLock[x + i][y + j] += key[i][j]
                    }
                }
                if check(newLock) {
                    return true
                }
                for i in 0..<m {
                    for j in 0..<m {
                        newLock[x + i][y + j] -= key[i][j]
                    }
                }
            }
        }
    }
   
    return false
}
