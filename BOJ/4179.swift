// BOJ 4179
let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! }
let r = inputs[0], c = inputs[1]
var map = Array(repeating: [String](), count: r)
var time = Array(repeating: Array(repeating: -1, count: c), count: r)
var visit = Array(repeating: Array(repeating: -1, count: c), count: r)
var jihun = (0, 0)

for i in 0..<r {
    map[i] = readLine()!.map { String($0) }
}

var queue = [(Int, Int)]()

for i in 0..<r {
    for j in 0..<c {
        if map[i][j] == "F" {
            queue.append((i, j))
            time[i][j] = 0
        } else if map[i][j] == "J" {
            jihun = (i, j)
            visit[i][j] = 0
        }
    }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var escape = false

// 불 bfs
while !queue.isEmpty {
    let cur = queue.removeFirst()
    for i in 0..<4 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]

        if nx < 0 || nx >= r || ny < 0 || ny >= c { continue }
        if map[nx][ny] == "#" || time[nx][ny] >= 0 { continue }
        
        time[nx][ny] = time[cur.0][cur.1] + 1
        queue.append((nx, ny))
    }
}

queue.append((jihun.0, jihun.1))

// 지훈 bfs + 불 시간 확인
while !queue.isEmpty {
    let cur = queue.removeFirst()
    for i in 0..<4 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]
        
        if nx < 0 || nx >= r || ny < 0 || ny >= c {
            print(visit[cur.0][cur.1] + 1)
            escape = true
            break
        }
        
        if map[nx][ny] == "#" || visit[nx][ny] >= 0 { continue }
        if time[nx][ny] != -1 && visit[nx][ny] + 1 >= time[nx][ny] { continue }
        
        
        visit[nx][ny] = visit[cur.0][cur.1] + 1
        queue.append((nx, ny))
        
    }
    if escape {
        break
    }
}

if !escape {
    print("IMPOSSIBLE")
}
