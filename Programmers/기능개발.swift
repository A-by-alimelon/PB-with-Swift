func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progresses = progresses
    var speeds = speeds
    var answer = [Int]()
    
    while !progresses.isEmpty {
        for i in 0..<progresses.count {
            progresses[i] += speeds[i]
        }
        
        var count = 0
        
        while progresses.first != nil && progresses.first! >= 100 {
            count += 1
            progresses.removeFirst()
            speeds.removeFirst()
        }
        
        if count != 0 {
            answer.append(count)
        }
    }
    return answer
}

print(solution([93, 30, 55], [1, 30, 5]))
print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
