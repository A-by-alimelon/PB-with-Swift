let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
var n = inputs[0], m = inputs[1], k = inputs[2]

var arr = readLine()!.split(separator: " ").map { return Int($0)! }
arr.sort()
let first = arr.popLast()!
let second = arr.popLast()!

var kCount = 0
var result = 0

while m > 0 {
    if kCount < k {
        result += first
        kCount += 1
    } else {
        result += second
        kCount = 0
    }
    m -= 1
}

print(result)

// 수식으로 풀기

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
var n = inputs[0], m = inputs[1], k = inputs[2]

var arr = readLine()!.split(separator: " ").map { return Int($0)! }
arr.sort()
let first = arr.popLast()!
let second = arr.popLast()!

var count = m / (k + 1) * k
count += m % (k + 1)

var result = 0
result += count * first
result += (m - count) * second

print(result)