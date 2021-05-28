// BOJ 9663
let n = Int(readLine()!)!
var count = 0

var isUsed1 = Array(repeating: false, count: n)
var isUsed2 = Array(repeating: false, count: 2 * n - 1)
var isUsed3 = Array(repeating: false, count: 2 * n - 1)

func queen(_ k: Int) { // 현재 k행 까지의 queen을 놓음
    if k == n {
        count += 1
        return
    }
    
    for i in 0..<n {
        if !isUsed1[i] && !isUsed2[k+i] && !isUsed3[k-i+n-1] {
            isUsed1[i] = true
            isUsed2[k+i] = true
            isUsed3[k-i+n-1] = true
            queen(k+1)
            isUsed1[i] = false
            isUsed2[k+i] = false
            isUsed3[k-i+n-1] = false
        }
    }
}

queen(0)
print(count)