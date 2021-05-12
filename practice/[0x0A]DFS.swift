// DFS
var board = [[1,1,1,0,1,0,0,0,0,0],
    [1,0,0,0,1,0,0,0,0,0],
    [1,1,1,0,1,0,0,0,0,0],
    [1,1,0,0,1,0,0,0,0,0],
    [0,1,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0]]
// 1이 파란 칸, 0이 빨간 칸

var n = 7, m = 10
var visit = Array(repeating: Array(repeating: -1, count: m), count: n)
var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]
var stack = [(Int, Int)]()
visit[0][0] = 1
stack.append((0, 0))

while !stack.isEmpty {
    let cur = stack.removeLast()
    print("( \(cur.0), \(cur.1) ) ->", terminator: " ")
    for i in 0..<4 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
        if visit[nx][ny] != -1 || board[nx][ny] == 0 { continue }
        
        visit[nx][ny] = 1
        stack.append((nx, ny))
    }
}
print()