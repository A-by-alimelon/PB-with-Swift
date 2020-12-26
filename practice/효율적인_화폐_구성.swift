import Foundation

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

var D: [Int] = Array(repeating: 10001, count: m+1)

D[0] = 0
for i in 0..<n {
    if array[i] > m+1 { continue }
    for j in array[i]..<m+1 {
        if D[j-array[i]] != 10001 {
            D[j] = min(D[j], D[j-array[i]]+1)
        }
    }
}

if D[m] == 10001 {
    print(-1)
} else {
    print(D[m])
}