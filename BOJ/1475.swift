// BOJ 1475
let room = readLine()!
var nums = Array(repeating: 0, count: 10)

for i in room {
    if i == "9" {
        nums[6] += 1
    } else {
        nums[Int(String(i))!] += 1
    }
}

nums[6] = nums[6] == 0 ? 0 : (nums[6] - 1) / 2 + 1
print(nums.max()!)