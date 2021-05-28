// BOJ 13300
let inputs = readLine()!.split(separator:" ").map { return Int(String($0))! }
let N = inputs[0], k = inputs[1]
var boys = Array(repeating: 0, count: 6)
var girls = Array(repeating: 0, count: 6)

for _ in 0..<N {
    let student = readLine()!.split(separator: " ").map { Int(String($0))! }
    if student[0] == 0 {
        girls[student[1] - 1] += 1
    } else {
        boys[student[1] - 1] += 1
    }
}

var rooms = 0
for i in 0..<6 {
    rooms += girls[i] == 0 ? 0 : (girls[i] - 1) / k + 1
    rooms += boys[i] == 0 ? 0 : (boys[i] - 1) / k + 1
}

print(rooms)