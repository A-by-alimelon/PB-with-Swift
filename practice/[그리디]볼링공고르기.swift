let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], k = inputs[1]

let balls = readLine()!.split(separator: " ").map { return Int($0)! }
var count = 0

selectBall(balls, selected: [], shouldSelect: 2, current: 0)

print(count)


func selectBall(_ balls: [Int], selected : [Int], shouldSelect: Int, current index: Int) {
    if shouldSelect == 0 {
        count += 1
    } else if index == balls.count {
        return
    } else {
        var newSelected = selected
        if balls[index] != newSelected.first {
            newSelected.append(balls[index])
            selectBall(balls, selected: newSelected, shouldSelect: shouldSelect - 1, current: index + 1)
        }
        selectBall(balls, selected: selected, shouldSelect: shouldSelect, current: index + 1)
    }
}


/////다른 방법

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
var n = inputs[0], m = inputs[1]

let balls = readLine()!.split(separator: " ").map { return Int($0)! }
var arr = Array(repeating: 0, count: 11)

for ball in balls {
    arr[ball] += 1
}

var count = 0

for i in 1..<m + 1 {
    n -= arr[i]
    count += arr[i] * n
}

print(count)