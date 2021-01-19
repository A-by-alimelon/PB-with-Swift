func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    
    var result = [[Int]: Int]()

    build_frame.forEach { step in
        let w = step[0]
        let h = step[1]
        let type = step[2]
        var temp = result
        
        // 설치
        if step[3] == 1 {
    
            temp[[w, h, type]] = 1
            
            if check(answers: temp) {
                result = temp
            }
            
        }
        
        // 제거
        else {
            
            temp.removeValue(forKey: [w, h, type])
            
            if check(answers: temp) {
                result = temp
            }
            
        }
    }
    
    return result.keys.sorted(by: sortResult(this:that:))
}

func sortResult(this: [Int], that: [Int]) -> Bool {
    if this[0] == that[0] {
        if this[1] == that[1] {
            return this[2] < that[2]
        } else {
            return this[1] < that[1]
        }
    } else {
        return this[0] < that[0]
    }
}

func check(answers: [[Int] : Int]) -> Bool {
    
    for key in answers.keys {
        
        let answer = key
        let w = answer[0]
        let h = answer[1]
        let type = answer[2]
        
        // 0이면 기둥, 1이면 보
        if type == 0 {
            
            if h != 0 && answers[[w - 1, h, 1]] == nil && answers[[w, h, 1]] == nil && answers[[w, h - 1, 0]] == nil {
                return false
            }
            
        } else {
            
            if (answers[[w - 1, h, 1]] == nil || answers[[w + 1, h, 1]] == nil) && answers[[w, h - 1, 0]] == nil && answers[[w + 1, h - 1, 0]] == nil {
                return false
            }
            
        }
    }
    
    return true
}