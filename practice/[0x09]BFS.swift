// BFS
let board = [
    [1,1,1,0,1,0,0,0,0,0],
    [1,0,0,0,1,0,0,0,0,0],
    [1,1,1,0,1,0,0,0,0,0],
    [1,1,0,0,1,0,0,0,0,0],
    [0,1,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0]]
let n = 7, m = 10
var visit = Array(repeating: Array(repeating: 0, count: m), count: n)
let dx = [0, 1, -1, 0]
let dy = [-1, 0, 0, 1]

var queue = [(Int, Int)]()
visit[0][0] = 1
queue.append((0, 0))

while !queue.isEmpty {
    let cur = queue.removeFirst()
    print("(\(cur.0), \(cur.1)) -> ", terminator: "")
    for i in 0..<4 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= m {
            continue
        }
        if visit[nx][ny] == 1 || board[nx][ny] != 1 {
            continue
        }
        visit[nx][ny] = 1
        queue.append((nx, ny))
    }
}