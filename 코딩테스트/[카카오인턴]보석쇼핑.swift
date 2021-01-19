func solution(_ gems:[String]) -> [Int] {
    var dict: [String: Int] = [gems[0]: 1]
    let countOfGems = Set(gems).count
    var start = 0, end = 0
    var resultStart = 0, resultEnd = 0
    var length = 100000
    
    while start < gems.count && end < gems.count {
        if dict.keys.count == countOfGems {
            if length > end - start + 1{
                length = end - start + 1
                resultStart = start
                resultEnd = end
            }
            
            if let exist = dict[gems[start]] {
                if exist - 1 == 0 {
                    dict.removeValue(forKey: gems[start])
                } else {
                    dict[gems[start]] = exist - 1
                }
            }
            
            
            start += 1
        }
        
        else {
            end += 1
            if end >= gems.count {
                break
            }
            if let exist = dict[gems[end]] {
                dict[gems[end]] = exist + 1
            } else {
                dict[gems[end]] = 1
            }
        }
    }
    
    return [resultStart + 1, resultEnd + 1]
}

print(solution(["AA", "AB", "AC", "AA", "AC"]))
print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
print(solution(["XYZ", "XYZ", "XYZ"]))
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"]))
