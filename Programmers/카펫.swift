// 카펫
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let targetNumber = (brown - 4) / 2
    
    for i in 1...targetNumber/2 {
        if i * (targetNumber-i) == yellow {
            return [targetNumber - i + 2, i + 2]
        }
    }
    
    return []
}

print(solution(8, 1))
print(solution(24, 24))