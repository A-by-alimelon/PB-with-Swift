// BOJ 1182
let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! }
let n = inputs[0], s = inputs[1]
let nums = readLine()!.split(separator: " ").map { return Int(String($0))! }

var count = 0

func select(_ cur: Int, _ sum: Int) { // 현재 합 sum, 선택된 원소 k개
    
    if cur == n {
        if sum == s {
            count += 1
        }
        return
    }
    
    select(cur+1, sum + nums[cur]) // 현재 인덱스의 숫자를 포함하는 경우
    select(cur+1, sum) // 현재 인덱스의 숫자를 포함하지 않는 경우
}

select(0, 0)
print(s == 0 ? count - 1 : count)