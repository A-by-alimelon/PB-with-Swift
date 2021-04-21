// 키패드 누르기
func solution (_ numbers: [Int], _ hand: String) -> String {
    var answer = ""
    var left = 10
    var right = 12
    
    numbers.forEach {
        if [1, 4, 7].contains($0) {
            answer += "L"
            left = $0
        } else if [3, 6, 9].contains($0) {
            answer += "R"
            right = $0
        } else {
            var target = $0
            if $0 == 0 {
                target = 11
            }
            let leftDistance = abs(((left - 1) / 3) - ((target - 1) / 3)) + abs(((left - 1) % 3) - ((target - 1) % 3))
            let rightDistance = abs(((right - 1) / 3) - ((target - 1) / 3)) + abs(((right - 1) % 3) - ((target - 1) % 3))
     
            if leftDistance == rightDistance {
                if hand == "right" {
                    answer += "R"
                    right = target
                } else {
                    answer += "L"
                    left = target
                }
            } else {
                if leftDistance < rightDistance {
                    answer += "L"
                    left = target
                } else {
                    answer += "R"
                    right = target
                }
            }
        }
      
    }
    
    return answer
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
