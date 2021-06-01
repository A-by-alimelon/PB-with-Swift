// 모의고사
func solution(_ answers:[Int]) -> [Int] {
    let student1 = [1, 2, 3, 4, 5]
    let student2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let student3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var scores = Array(repeating: 0, count: 3)
    var result = [Int]()
    
    for i in 0..<answers.count {
        if answers[i] == student1[i % 5] {
            scores[0] += 1
        }
        if answers[i] == student2[i % 8] {
            scores[1] += 1
        }
        if answers[i] == student3[i % 10] {
            scores[2] += 1
        }
    }
    
    for i in 0..<3 {
        if scores[i] == scores.max() {
            result.append(i+1)
        }
    }
    
    return result
}

print(solution([1,3,2,4,2]))