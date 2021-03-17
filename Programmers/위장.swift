/// 위장
func solution(_ clothes:[[String]]) -> Int {
    var map = [String: [String]]()
    
    clothes.forEach {
        // 이 부분 주의하기
        if map[$0[1]] == nil {
            map[$0[1]] = ["", $0[0]]
        } else {
            map[$0[1]]?.append($0[0])
        }
    }
    
    var count = 1
    
    map.values.forEach {
        count *= $0.count
    }
    return count - 1
}