// BOJ 2490
for _ in 0..<3 {
    let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! }
    
    var count0 = 0
    var count1 = 0
    
    inputs.forEach {
        if $0 == 0 {
            count0 += 1
        } else {
            count1 += 1
        }
    }
    
    if count0 == 4 {
        print("D")
    } else if count0 == 1 {
        print("A")
    } else if count0 == 2 {
        print("B")
    } else if count0 == 3 {
        print("C")
    } else {
        print("E")
    }
}