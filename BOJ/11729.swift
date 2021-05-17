let n = Int(readLine()!)!

func move(_ a: Int, _ b: Int, _ n: Int) {
    if n == 1 {
        print("\(a) \(b)")
    } else {
        move(a, 6-a-b, n-1)
        print("\(a) \(b)")
        move(6-a-b, b, n-1)
    }
}

print((1<<n) - 1)
move(1, 3, n)