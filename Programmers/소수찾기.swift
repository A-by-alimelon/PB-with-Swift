// 소수 찾기
func solution(_ numbers:String) -> Int {
    let max = Int(numbers.sorted().reversed().map { return String($0) }.joined())!
    var dict = [Character: Int]()
    var count = 0
    
    numbers.forEach {
        if dict[$0] == nil {
            dict[$0] = 1
        } else {
            dict[$0]! += 1
        }
    }
    
    var primes = [Int]()

    for i in 2...max {
        if isPrime(i) {
            primes.append(i)
        }
    }
    
    primes.forEach {
        var temp = dict
        var check = true
        for c in String($0) {
            if temp[c] == nil || temp[c] == 0 {
                check = false
                break
            }
            
            temp[c]! -= 1
        }
        
        if check {
            count += 1
        }
    }
    return count
}


func isPrime(_ num: Int) -> Bool {
    var isPrime = true
    
    if num == 2 || num == 3 {
        return true
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            isPrime = false
            break
        }
    }
    
    return isPrime
}

print(solution("17"))