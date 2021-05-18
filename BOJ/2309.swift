// BOJ 2309
var nums = [Int]()
var arr = Array(repeating: 0, count: 101)

for _ in 0..<9 {
    let num = Int(readLine()!)!
    nums.append(num)
    arr[num] = 1
}

var differ = nums.reduce(0) { $0 + $1 } - 100
nums.sort()

for i in 0..<nums.count {
    if differ - nums[i] == nums[i] || differ < nums[i] || differ > 100 + nums[i] {
        continue
    }
    
    if arr[differ - nums[i]] == 1 {
        differ -= nums[i]
        nums.remove(at: i)
        break
    }
}

nums.forEach {
    if $0 == differ {
        return
    }
    
    print($0)
}