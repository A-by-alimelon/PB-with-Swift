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

func pop_front() {
    head += 1
}

func pop_back() {
    tail -= 1
}

func front() -> Int {
    return data[head]
}

func back() -> Int {
    return data[tail-1]
}

func test() {
    push_back(30)
    print(front())
    print(back())
    push_front(25)
    push_back(12)
    print(back())
    push_back(62)
    pop_front()
    print(front())
    pop_front()
    print(back())
}

test()