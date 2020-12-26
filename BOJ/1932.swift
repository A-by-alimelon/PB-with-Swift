import Foundation

let n = Int(readLine()!)!

var array = Array(repeating: [Int](), count: n)

for i in 0..<n {
    array[i].append(contentsOf: readLine()!.split(separator: " ").map { return Int($0)! })
}

var D = Array(repeating: Array(repeating: 0, count: n), count: n)

D[0][0] = array[0][0]

for i in 1..<n {
    for j in 0..<array[i].count {
        if j == 0 {
            D[i][j] = D[i-1][0] + array[i][0]
        } else {
            D[i][j] = max(D[i-1][j-1] + array[i][j], D[i-1][j] + array[i][j])
        }
    }
}

print(D[n-1].max()!)