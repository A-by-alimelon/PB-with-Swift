let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

var array = readLine()!.split(separator: " ").map { return Int($0)! }

var start = 0
var end = array.max()!

var result = 0

while start <= end {
    var total = 0
    let mid = (start + end) / 2
    
    array.forEach {
        if $0 > mid {
            total += $0 - mid
        }
    }
    
    if total < m {
        end = mid - 1
    } else {
        result = mid
        start = mid + 1
    }
}

print(result)
