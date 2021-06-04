// H-Index
func solution(_ citations:[Int]) -> Int {
    var answer = 0
    for i in 0..<citations.max()! {
        if citations.filter({ $0 >= i }).count >= i {
            answer = i
        } else {
            break
        }
    }
    
    return answer
}