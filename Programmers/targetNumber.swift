import Foundation

var inputNumbers = [Int](), targetNumber = 0
var result = 0

func solution(_ numbers: [Int], _ target: Int) -> Int {
    inputNumbers = numbers
    targetNumber = target
    dfs(0, 0)
    return result
}

func dfs(_ i: Int, _ sum: Int) {
    if i == inputNumbers.count {
        if sum == targetNumber { result += 1 }
    } else {
        dfs(i+1, sum + inputNumbers[i])
        dfs(i+1, sum - inputNumbers[i])
    }
}