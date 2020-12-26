import Foundation

let n = readLine()!.map { return Int(String($0))! }.first!
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }

var D: [Int] = Array(repeating: 0, count: 100)
D[0] = inputs[0]
D[1] = max(D[0], inputs[1])
for i in 2..<n {
    D[i] = max(D[i-1], D[i-2] + inputs[i])
}

print(D[n-1])