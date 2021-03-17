/// 다리를 지나는 트럭
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var readyQueue = truck_weights
    let first = readyQueue.removeFirst()
    var queue = [(first, bridge_length)]
    var weight = weight - first
    
    var time = 1
    
    while !queue.isEmpty {
        var count = 0
        for i in 0..<queue.count {
            queue[i].1 -= 1
            if queue[i].1 == 0 {
                weight += queue[i].0
                count += 1
            }
        }
        
        for _ in 0..<count {
            queue.removeFirst()
        }
        
        if let truck = readyQueue.first {
            if weight - truck >= 0 {
                readyQueue.removeFirst()
                weight -= truck
                queue.append((truck, bridge_length))
            }
        }
        
        time += 1
        
    }
    
    return time
}