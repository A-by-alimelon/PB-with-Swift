// BOJ 2587
var nums = [Int]()

for _ in 0..<5 {
    nums.append(Int(readLine()!)!)
}

nums.sort()
print(nums.reduce(0) { $0 + $1 } / 5)
print(nums[2])