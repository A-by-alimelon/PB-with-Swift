// BOJ 2576
var nums = [Int]()

for _ in 0..<7 {
    let num = Int(readLine()!)!
    if num % 2 == 1 {
        nums.append(num)
    }
}

if nums.isEmpty {
    print(-1)
} else {
    print(nums.reduce(0) { $0 + $1 } )
    print(nums.min()!)
}