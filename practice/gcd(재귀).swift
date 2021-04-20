// gcd - 재귀 이용
func gcd(_ a: Int, _ b: Int) -> Int{
    var a = a, b = b
    
    if a < b {
        swap(&a, &b)
    }
    
    if a == b {
        return a
    } else if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}

print(gcd(710, 310))
print(gcd(0, 7))
print(gcd(3,4))