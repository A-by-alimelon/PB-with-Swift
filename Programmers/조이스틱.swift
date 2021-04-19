func solution(_ name:String) -> Int {
    var answer = 0
    
    let a = UnicodeScalar("A").value
    let z = UnicodeScalar("Z").value
    
    var stringArray = Array(repeating: String("A"), count: name.count)
    let nameArray = name.map(String.init)
    
    var targets = [Int]()
    var targetCount = 0
    
    for i in 0..<nameArray.count {
        if nameArray[i] != stringArray[i] {
            targets.append(i)
        }
    }
    
    var current = 0
    var done = [Int]()
    
    while targetCount < targets.count {
        var forwardIndex: Int
        var backwardIndex: Int
        
        var i = 0
        repeat {
            forwardIndex = current + i >= targets.count ? current + i - targets.count : current + i
            i += 1
        } while done.contains(forwardIndex)
        
        i = 0
        repeat {
            backwardIndex = current - i < 0 ? current - i + targets.count : current - i
            i += 1
        } while done.contains(backwardIndex)
        
        
        var forwardDistance = targets[forwardIndex] - targets[current]
        var backwardDistance = targets[current] - targets[backwardIndex]
        
        if targetCount == 0 {
            forwardDistance = targets[0] - 0
            backwardDistance = 0 - targets[backwardIndex]
            forwardIndex = 0
        }
        
        if forwardDistance < 0 {
            forwardDistance += nameArray.count
        }
        
        if backwardDistance < 0 {
            backwardDistance += nameArray.count
        }
        
        answer += min(forwardDistance, backwardDistance)

        var targetIndex: Int
        
        if forwardDistance <= backwardDistance {
            targetIndex = targets[forwardIndex]
            current = forwardIndex
        } else {
            targetIndex = targets[backwardIndex]
            current = backwardIndex
        }
        
        if nameArray[targetIndex] != stringArray[targetIndex] {
            let value = UnicodeScalar(nameArray[targetIndex])!.value
            let forAlpha = Int(value - a)
            let backAlpha = Int(z - value + 1)
            
            answer += min(forAlpha, backAlpha)
            
            stringArray[targetIndex] = nameArray[targetIndex]
            targetCount += 1
            done.append(current)
        }

        
    }
    
    return answer
}

print(solution("JAN"))
print(solution("JEROEN"))
print(solution("XAAAAAAAYZ"))
print(solution("BAAAAIAAAAAAE"))
