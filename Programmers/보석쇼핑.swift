// 보석 쇼핑
func solution(_ gems:[String]) -> [Int] {
    var answer = Array(repeating: 0, count: 2)
    var start = 0
    var end = 1
    var length = 100005
    var temp = [gems[0]]
    
    let setCount = Set(gems).count
    
    while true {
        if Set(temp).count == setCount {
            if length > end - start {
                length = end - start
                answer[0] = start + 1
                answer[1] = end
            }
            temp.removeFirst()
            start += 1
        } else if end == gems.count { break }
        else {
            temp.append(gems[end])
            end += 1
        }
        
    }
    
    return answer
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
print(solution(["AA", "AB", "AC", "AA", "AC"]))
print(solution(["XYZ", "XYZ", "XYZ"]))
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"]))