// 수식 최대화
func solution(_ expression:String) -> Int64 {
    let numbers = expression.components(separatedBy: ["+", "-", "*"]).map { Int($0)! }
    let opers = expression.filter { return !($0).isNumber }.map{ String($0) }
    
    // 연산자 우선순위 순열
    var operOrders = [[String]]()
    var allOpers = ["-", "+", "*"]
    
    func permutation(_ k: Int) {
        if k == allOpers.count {
            operOrders.append(allOpers)
            return
        }
        
        for i in k..<allOpers.count {
            allOpers.swapAt(k, i)
            permutation(k + 1)
            allOpers.swapAt(k, i)
        }
    }
    
    permutation(0)
    
    var max = -1
    
    // 연산하기
    for order in operOrders {
        var tempNumbers = numbers
        var tempOpers = opers
        for oper in order {
            var count = 0
            for i in 0..<tempOpers.count {
                if tempOpers[i-count] == oper {
                    let result = calculate(oper, tempNumbers[i-count], tempNumbers[i-count+1])
                    tempNumbers[i-count...i-count+1] = [result]
                    tempOpers.remove(at: i-count)
                    count += 1
                }
            }
        }
        if abs(tempNumbers.first!) > max {
            max = abs(tempNumbers.first!)
        }
    }
    return Int64(max)
}

func calculate(_ oper: String, _ num1: Int, _ num2: Int) -> Int {
    switch oper {
    case "-":
        return num1 - num2
    case "+":
        return num1 + num2
    case "*":
        return num1 * num2
    default:
        return 0
    }
}

print(solution("100-200*300-500+20"))
print(solution("50*6-3*2"))