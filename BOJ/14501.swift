import Foundation

let n = Int(readLine()!)!

var t = [Int]()
var p = [Int]()

for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
    t.append(inputs[0])
    p.append(inputs[1])
}

var D = Array(repeating: 0, count: n + 1)
var maxValue = 0

for i in (0..<n).reversed() {
    let time = i + t[i]
    if time <= n {
        D[i] = max(p[i] + D[time], maxValue)
        maxValue = D[i]
    } else {
        D[i] = maxValue
    }
}

print(maxValue)