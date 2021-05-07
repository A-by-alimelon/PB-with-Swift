// 징검다리 건너기
func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 1
    var end = stones.max()!
    var answer = 0
    
    func cross(_ num: Int) -> Bool {
        let temp = stones.map { return $0 - num }
        var count = 0
        
        for t in temp {
            if t < 0 {
                count += 1
            } else {
                count = 0
            }
            
            if count == k {
                return false
            }
        }
        return true
    }
    
    while start <= end {
    let mid = (start + end) / 2
        if cross(mid) {
            answer = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return answer
}

print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))