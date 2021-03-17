// 효율성 고려한 코드
func solution(_ prices: [Int]) -> [Int] {
    var stack = [Int]()
    var result = Array(repeating: 0, count: prices.count)
    
    prices.enumerated().forEach {
        while !stack.isEmpty && prices[stack.last!] > $0.element {
            let index = stack.popLast()!
            result[index] = $0.offset - index
        }
        
        stack.append($0.offset)
        print("stack: \(stack)")
    }
    
    stack.forEach {
        result[$0] = prices.count - 1 - $0
    }
    
    return result
}

print(solution([1, 2, 3, 2, 3]))
print(solution([5, 8, 6, 2, 4, 1]))