let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! }
let N = inputs[0], r = inputs[1], c = inputs[2]

func visit(_ n: Int, _ r: Int, _ c: Int) -> Int {
    if n == 0 {
        return 0
    }
    
    let half = 1 << (n - 1)
    
    if r < half && c < half {
        return visit(n-1, r, c)
    } else if r < half && c >= half {
        return half * half + visit(n - 1, r, c - half)
    } else if r >= half && c < half {
        return 2 * half * half + visit(n - 1, r - half, c)
    } else {
       return 3 * half * half + visit(n - 1, r - half, c - half)
    }
}


print(visit(N, r, c))