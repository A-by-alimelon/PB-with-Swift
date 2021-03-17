/// 주식가격
func solution(_ prices: [Int]) -> [Int] {
    let stack = prices.reversed()
    var array = [Int]()
    var result = [Int]()
    
    stack.forEach {
        array.append($0)
        for (index, value) in array.reversed().enumerated() {
            if value < $0 {
                result.append(array.count - 1 - index)
                return
            }
        }
        result.append(array.count - 1)
    }
    
    return result.reversed()
}

print(solution([1, 2, 3, 2, 3]))