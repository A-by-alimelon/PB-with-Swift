// 스택
var max = 1000005
var data = Array(repeating: 0, count: max)
var pos = 0

func push(_ x: Int) {
    data[pos] = x
    pos += 1
}

func pop() {
    pos -= 1
}

func top() -> Int {
   return data[pos-1]
}

func test() {
    push(5); push(4); push(3);
    print(top())
    pop(); pop();
    print(top())
    push(10); push(12);
    print(top())
    pop();
    print(top())
}

test()
