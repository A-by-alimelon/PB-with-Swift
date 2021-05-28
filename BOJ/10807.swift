// BOJ 10807
let N = Int(readLine()!)!
var arr = Array(repeating: 0, count: 202)

let nums = readLine()!.split(separator: " ").map { return Int(String($0))!}
for n in nums {
    arr[n+100] += 1
}

let target = Int(readLine()!)!
print(arr[target+100])