// 부품 찾기 - Set (집합 자료형) 이용
let n = Int(readLine()!)!

var inputs = Set(readLine()!.split(separator: " ").map { return Int($0)!})


let m = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { return Int($0)! }

targets.forEach {
    if inputs.contains($0) {
        print("yes", terminator: " ")
    } else {
        print("no", terminator: " ")
    }
}