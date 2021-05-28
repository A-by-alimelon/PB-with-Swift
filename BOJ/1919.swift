// BOJ 1919
let a = readLine()!
let b = readLine()!
var alphaA = Array(repeating: 0, count: 26)
var alphaB = Array(repeating: 0, count: 26)
let valueA = UnicodeScalar("a").value

for c in a {
    let target = UnicodeScalar(String(c))!.value
    alphaA[Int(target % valueA)] += 1
}

for c in b {
    let target = UnicodeScalar(String(c))!.value
    alphaB[Int(target % valueA)] += 1
}

var count = 0

for i in 0..<26 {
    if alphaA[i] == alphaB[i] {
        continue
    }
    
    count += abs(alphaA[i] - alphaB[i])
}

print(count)