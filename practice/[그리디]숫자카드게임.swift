let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
var n = inputs[0], m = inputs[1]

var arr = Array(repeating: [Int](), count: n)
var result = 0

for i in 0..<m {
    arr[i].append(contentsOf: readLine()!.split(separator: " ").map { return Int($0)! })
    let minValue = arr[i].min()!
    result = max(result, minValue)
}

print(result)