// 야매 연결 리스트 (Int)
var max = 1000005
var data = Array(repeating: -1, count: max)
var pre = Array(repeating: -1, count: max)
var nxt = Array(repeating: -1, count: max)
var unused = 1;

func insert(_ addr: Int, _ num: Int) {
    // 새로운 원소 생성 후 pre, nxt 지정
    data[unused] = num
    pre[unused] = addr
    nxt[unused] = nxt[addr]
    
    if nxt[addr] != -1 {
        pre[nxt[addr]] = unused
    }
    
    nxt[addr] = unused
    
    unused += 1
}

// 메모리 누수 있지만 신경쓰지 않겠다.
func erase(_ addr: Int) {
    nxt[pre[addr]] = nxt[addr]
    
    if nxt[addr] != -1 {
        pre[nxt[addr]] = pre[addr]
    }
}

func traverse() {
    var cur = nxt[0]
    
    while cur != -1 {
        print(data[cur], terminator: " ")
        cur = nxt[cur]
    }
    
    print()
}

func insert_test() {
    print("****** insert_test *****")
    insert(0, 10)
    traverse()
    insert(0, 30)
    traverse()
    insert(2, 40)
    traverse()
    insert(1, 20)
    traverse()
    insert(4, 70)
    traverse()
}

func erase_test() {
    print("****** erase_test *****")
    erase(1)
    traverse()
    erase(2)
    traverse()
    erase(4)
    traverse()
    erase(5)
    traverse()
    erase(3)
    traverse()
}

insert_test()
erase_test()