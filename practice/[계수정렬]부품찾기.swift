// 부품 찾기 - 계수 정렬 이용
let n = Int(readLine()!)!
var array = Array(repeating: 0, count: 1000001)


var inputs = readLine()!.split(separator: " ").map { return Int($0)!}
inputs.forEach {
    array[$0] = 1
}

let m = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { return Int($0)! }

targets.forEach {
    if array[$0] == 1 {
        print("yes", terminator: " ")
    } else {
        print("no", terminator: " ")
    }
}
