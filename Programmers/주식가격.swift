/// 주식가격
func solution(_ prices: [Int]) -> [Int] {
    let stack = prices.reversed()
    var array = [Int]()
    var result = [Int]()
    
    stack.forEach {
        array.append($0)
        print("array: \(array)")
        for i in stride(from: array.count-1, to: 0, by: -1) {
            print("value: \(array[i]), $0: \($0), index: \(i)")
            if array[i] < $0 {
                print(array.count - 1 - i)
                result.append(array.count - 1 - i)
                return
            }
            
        }
        result.append(array.count - 1)
        print("result: \(result)")
    }
    
    return result.reversed()
}


print(solution([1, 2, 3, 2, 3]))
print(solution([5, 8, 6, 2, 4, 1]))