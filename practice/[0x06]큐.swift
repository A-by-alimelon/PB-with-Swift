// 큐
var max = 1000005
var data = Array(repeating: 0, count: max)
var head = 0, tail = 0

func push(_ x: Int) {
    data[tail] = x
    tail += 1
}

func pop() {
    head += 1
}

func front() -> Int {
    return data[head]
}

func back() -> Int {
    return data[tail-1]
}

func test() {
    push(10); push(20); push(30);
    print(front())
    print(back())
    pop(); pop();
    push(15); push(25);
    print(front())
    print(back())
}

test()