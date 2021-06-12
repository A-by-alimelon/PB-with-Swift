// 피보나치 수열 - 재귀
func fibo(_ num: Int) -> Int {
    if num == 1 || num == 2 {
        return 1
    } else {
        return fibo(num - 1) + fibo(num - 2)
    }
}


// 피보나치 수열 - 반복분
func fibo(_ num: Int) -> Int {
    var f = Array(repeating: 0, count: num + 1)
    f[0] = 0
    f[1] = 1
    
    if num == 1 {
        return 1
    } else {
        for i in 2...num {
            f[i] = f[i - 1] + f[i - 2]
        }
    }
    
    return f[num]
}