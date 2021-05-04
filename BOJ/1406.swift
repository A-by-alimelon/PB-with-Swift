// BOJ 1406
// 야매 연결 리스트 이용
var max = 600005
var data = Array(repeating: "", count: max)
var pre = Array(repeating: -1, count: max)
var nxt = Array(repeating: -1, count: max)
var unused = 1;

func insert(_ addr: Int, _ str: String) {
    // 새로운 원소 생성 후 pre, nxt 지정
    data[unused] = str
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

func printString() {
    var cur = nxt[0]
    
    while cur != -1 {
        print(data[cur], terminator: "")
        cur = nxt[cur]
    }
    
    print()
}

var string = Array(readLine()!)

for i in 0..<string.count {
    insert(i, String(string[i]))
}

let n = Int(readLine()!)!
var cursor = string.count

for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map { return String($0) }
    
    switch command.first {
    case "L":
        if pre[cursor] != -1 {
            cursor = pre[cursor]
        }
    case "D":
        if nxt[cursor] != -1 {
            cursor = nxt[cursor]
        }
        
    case "B":
        if cursor != 0 {
            erase(cursor)
            cursor = pre[cursor]
        }
    case "P":
        insert(cursor, command[1])
        cursor = nxt[cursor]
    default:
        print()
    }

}

printString()
