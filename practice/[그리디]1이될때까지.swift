let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
var n = inputs[0], k = inputs[1]
var count = 0

while n != 1 {
    if n % k == 0 {
        n /= k
    } else {
        n -= 1
    }
    count += 1
}

print(count)

// 다른 풀이 (더 빠름)

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
var n = inputs[0], k = inputs[1]
var count = 0

while true {
    let target = (n / k) * k
    count += n - target
    n = target
    
    if n < k {
        break
    }
    count += 1
    n /= k
}

count += (n - 1)
print(count)