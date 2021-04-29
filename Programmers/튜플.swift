// 튜플
func solution(_ s:String) -> [Int] {
    var arrayS = Array(s)
    var tuples = [Set<Int>]()
    
    arrayS.removeFirst()
    arrayS.removeLast()
    
    var temp = Set<Int>()
    var tempStr = ""
    
    arrayS.forEach {
        if $0 == "{" {
            temp.removeAll()
        } else if $0 == "," {
            temp.insert(Int(tempStr)!)
            tempStr = ""
        } else if $0 == "}" {
            temp.insert(Int(tempStr)!)
            tuples.append(temp)
        } else {
            tempStr += String($0)
        }
    }
    
    tuples.sort{ (v1, v2) -> Bool in
        return v1.count < v2.count
    }
    
    var result = [Int]()
    
    for t in tuples {
        result.append(contentsOf: t.subtracting(result))
    }
    
    return result
}


print(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
print(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"))
print(solution("{{20,111},{111}}"))
print(solution("{{123}}"))
print(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"))
