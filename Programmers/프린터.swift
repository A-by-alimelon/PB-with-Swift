/// 주식가격
func solution(_ priorities:[Int], _ location:Int) -> Int {
    let targetNumber = priorities[location]
    var count = 0
    var priorities = priorities
    var indexes =  [Int]()
    
    for i in 0..<priorities.count {
        indexes.append(i)
    }
 
    while priorities.max() != targetNumber {
        let max = priorities.max()
        let value = priorities.removeFirst()
        
        if value == max {
            
            count += 1
            indexes.removeFirst()
        } else {
            priorities.append(value)
            indexes.append(indexes.removeFirst())
        }
    }
    
    while indexes.first != location {
        let value = priorities.removeFirst()
        if value == targetNumber {
            count += 1
            indexes.removeFirst()
        } else {
            priorities.append(value)
            indexes.append(indexes.removeFirst())
        }
    }

    return count + 1
}

print(solution([2, 1, 3, 2], 2))
print(solution([1, 1, 9, 1, 1, 1], 0))
print(solution([1], 0))