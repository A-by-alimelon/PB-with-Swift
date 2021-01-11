let n = Int(readLine()!)!
var arr = [Int]()

arr.append(contentsOf: readLine()!.split(separator: " ").map { return Int($0)! })


arr.sort()
var count = 0
var result = 0

for i in arr {
    count += 1
    if count >= i {
        result += 1
        count = 0
    }
}

print(result)
