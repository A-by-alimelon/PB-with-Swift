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

/// 빈 공간을 삽입하는 방법으로 푸는 코드 (위의 코드보다 느림)
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var queue = Array(repeating: 0, count: bridge_length)
    var count = 0
    var currentWeight = 0
    var trucks = truck_weights
    
    while !queue.isEmpty {
        currentWeight -= queue.removeFirst()
        
        if let truck = trucks.first {
            if currentWeight + truck <= weight {
                queue.append(truck)
                currentWeight += trucks.removeFirst()
            } else {
                queue.append(0)
            }
        }
        else {
            count += 1
            continue
        }
        
        
        count += 1
    }
    return count
}
