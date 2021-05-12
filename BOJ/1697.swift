// BOJ 1697
let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! }
var queue = [Int]()
let move = [1, -1, 2]
var visit = Array(repeating: -1, count: 100001)

queue.append(inputs[0])
visit[inputs[0]] = 0
var check = false

while !queue.isEmpty {
    let cur = queue.removeFirst()
    
    if cur == inputs[1] {
        print(visit[cur])
        check = true
        break
    }
    
    for i in 0..<3 {
        var next = 0
        if move[i] == 2 {
            next = 2 * cur
        } else {
            next = cur + move[i]
        }
        
        if next < 0 || next > 100000 || visit[next] != -1 { continue }

        visit[next] = visit[cur] + 1
        queue.append(next)
    }
    
    if check {
        break
    }
}	