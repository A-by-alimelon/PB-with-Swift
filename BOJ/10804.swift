// BOJ 10804
var cards = [Int]()
for i in 1..<21 {
    cards.append(i)
}

for _ in 0..<10 {
    let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! - 1 }
    
    for i in 0..<Int(round(Double((inputs[1] - inputs[0])) / 2)) {
        cards.swapAt(inputs[0] + i, inputs[1] - i)
    }
    
}

cards.forEach {
    print($0, terminator: " ")
}