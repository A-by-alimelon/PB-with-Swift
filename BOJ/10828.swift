// 스택
var max = 10005
var data = Array(repeating: 0, count: max)
var pos = 0

func push(_ x: Int) {
    data[pos] = x
    pos += 1
}

func pop() -> Int {
    if pos == 0 {
        return -1
    }
    
    pos -= 1
    return data[pos]
}

func top() -> Int {
    if pos == 0 {
        return -1
    }
    return data[pos-1]
}


// BOJ 10828
var n = Int(readLine()!)!

for _ in 0..<n {
    let command = readLine()!.split(separator: " ")
    
    switch command[0] {
    case "push":
        push(Int(command[1])!)
    case "pop":
        print(pop())
    case "top":
        print(top())
    case "size":
        print(pos)
    case "empty":
        print(pos == 0 ? 1 : 0)
    default:
        print()
    }
}
