let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

var numbers = [Int]()

for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}
numbers.sort()

var temp = 0, result = 2000000000
var start = 0, end = 1

while true {
    if end == n || start == n {
        break
    }
    
    temp = numbers[end] - numbers[start]
    
    if temp >= m {
        if temp < result {
            result = temp
        }
        start += 1
    } else {
        end += 1
    }
    
}

print(result)