let n = Int(readLine()!)!

var count = 0

for i in 0..<n + 1 {
    for j in 0..<60 {
        for k in 0..<60 {
            if ("\(i)" + "\(j)" + "\(k)").contains("3") {
                count += 1
            }
        }
    }
}

print(count)