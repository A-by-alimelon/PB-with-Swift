let n = Int(readLine()!)!
var coins = readLine()!.split(separator: " ").map { return Int($0)! }
coins.sort()

var target = 1
  
for x in coins {
    if target < x {
        break
    }
    target += x
}

print(target)