// BOJ 1629
func mod(_ n: Int64, _ a: Int64, _ m: Int64) -> Int64 {
    if n == 1 {
        return a % m
    }
    
    var val = mod(n/2, a, m)
    val = (val * val) % m
    
    if n % 2 == 0 {
        return val
    }
    return (val * a) % m
}

let inputs = readLine()!.split(separator: " ").map { return Int64(String($0))! }
print(mod(inputs[1], inputs[0], inputs[2]))