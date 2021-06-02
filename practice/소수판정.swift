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

print(isPrime(7))