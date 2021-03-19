/// 더 맵게
func solution(_ scoville: [Int], _ k: Int) -> Int {
    var count = 0
    var minHeap = MinHeap<Int>()
    
    scoville.forEach {
        minHeap.insert($0)
    }
    
    while true {
        guard let first = minHeap.pop(), let second = minHeap.pop() else {
            return -1
        }
        
        if first < k {
            let new = first + (second * 2)
            minHeap.insert(new)
            count += 1
        } else {
            break
        }
    }
    
    return count
}