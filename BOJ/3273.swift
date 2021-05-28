// BOJ 3273
let n = Int(readLine()!)!
let inputs = readLine()!.split(separator: " " ).map { return Int(String($0))! }
var arr = Array(repeating: 0, count: 1000001)
let x = Int(readLine()!)!

for i in inputs {
    arr[i] += 1
}

var count = 0

for i in inputs {
    if x <= i { continue }
    if arr[x-i] > 0 {
        count += 1
    }
}

print(count/2)