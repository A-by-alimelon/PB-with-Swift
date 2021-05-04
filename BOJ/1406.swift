// BOJ 1406
var lStack = Array(readLine()!)
var rStack = [Character]()

let n = Int(readLine()!)!
for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map { return String($0) }
    switch command[0] {
    case "L":
        if !lStack.isEmpty {
            rStack.append(lStack.removeLast())
        }
    case "D":
        if !rStack.isEmpty {
            lStack.append(rStack.removeLast())
        }
    case "B":
        if !lStack.isEmpty {
            lStack.removeLast()
        }
        
    case "P":
        lStack.append(contentsOf: command[1])
    default:
        print()
    }
}

print((lStack + rStack.reversed()).map{ return String($0) }.joined())
