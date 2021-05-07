// 징검다리 건너기
func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 0
    var end = k
    var min = 300000000
    
    while end != stones.count + 1 {
        let temp = stones[start..<end]
        let max = temp.max()!
        
        if min > max {
            min = max
        }
        
        start += 1
        end += 1
    }

    return min
}

print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))