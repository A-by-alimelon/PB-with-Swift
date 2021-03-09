let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], c = inputs[1]

var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}
array.sort()

var start = 1
var end = array.last! - array[0]
var result = 0


while start <= end {
    
    let mid = (start + end) / 2
    var value = array[0]
    var count = 1
    
    for i in 1..<n {
        if array[i] >= value + mid {
            count += 1
            value = array[i]
        }
    }
    
    if count < c {
        end = mid - 1
    } else {
        start = mid + 1
        result = mid
    }
}

print(result)