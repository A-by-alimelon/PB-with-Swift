// 덱
var max = 500000 // 중간 지점
var data = Array(repeating: 0, count: 2*max+1)
var head = max, tail = max

func push_front(_ x: Int) {
    head -= 1
    data[head] = x
}

func push_back(_ x: Int) {
    data[tail] = x
    tail += 1
}

func pop_front() -> Int {
    if empty() == 1 {
        return -1
    }
    head += 1
    return data[head-1]
}

func pop_back() -> Int {
    if empty() == 1 {
        return -1
    }
    tail -= 1
    return data[tail]
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
// BOJ 10866
let n = Int(readLine()!)!
for _ in 0..<n {
    let command = readLine()!.split(separator: " ")
    switch command[0] {
    case "push_back":
        push_back(Int(command[1])!)
    case "push_front":
        push_front(Int(command[1])!)
    case "pop_front":
        print(pop_front())
    case "pop_back":
        print(pop_back())
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