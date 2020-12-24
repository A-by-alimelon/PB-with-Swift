import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { return Int($0)! }
let operators = readLine()!.split(separator: " ").map { return Int($0)! }
var add = operators[0], sub = operators[1], mul = operators[2], div = operators[3]

var minValue = 999999999
var maxValue = -999999999

func dfs(_ i: Int, _ sum: Int) {
    if i == numbers.count {
        minValue = min(minValue, sum)
        maxValue = max(maxValue, sum)
    } else {
        if add > 0 {
            add -= 1
            dfs(i + 1, sum + numbers[i])
            add += 1
        }
        if sub > 0 {
            sub -= 1
            dfs(i + 1, sum - numbers[i])
            sub += 1
        }
        if mul > 0 {
            mul -= 1
            dfs(i + 1, sum * numbers[i])
            mul += 1
        }
        if div > 0 {
            div -= 1
            dfs(i + 1, Int(sum / numbers[i]))
            div += 1
        }
    }
}

dfs(1, numbers[0])
print(maxValue)
print(minValue)