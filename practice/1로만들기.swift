let x = Int(readLine()!)!

var D: [Int] = Array(repeating: 0, count: 30001)

for i in 2..<x + 1 {
    D[i] = D[i-1] + 1
    if i % 2 == 0 {
        D[i] = min(D[i], D[i/2] + 1)
    }
    if i % 3 == 0 {
        D[i] = min(D[i], D[i/3] + 1)
    }
    if i % 5 == 0 {
        D[i] = min(D[i], D[i/5] + 1)
    }
}

print(D[x])