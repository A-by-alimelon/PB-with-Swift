// 큐
var max = 10005
var data = Array(repeating: 0, count: max)
var head = 0, tail = 0

func push(_ x: Int) {
    data[tail] = x
    tail += 1
}

func pop() -> Int {
    if empty() == 1 {
        return -1
    }
    head += 1
    return data[head-1]
}

func front() -> Int {
    if empty() == 1 {
        return -1
    }
    return data[head]
}

func back() -> Int {
    if empty() == 1 {
        return -1
    }
    return data[tail-1]
}

func size() -> Int {
    return tail - head
}

func empty() -> Int {
    return size() == 0 ? 1 : 0
}

// BOJ 10845
let n = Int(readLine()!)!
for _ in 0..<n {
    let command = readLine()!.split(separator: " ")
    switch command[0] {
    case "push":
        push(Int(command[1])!)
    case "pop":
        print(pop())
    case "front":
        print(front())
    case "back":
        print(back())
    case "size":
        print(size())
    case "empty":
        print(empty())
    default:
        print()
    }
}
