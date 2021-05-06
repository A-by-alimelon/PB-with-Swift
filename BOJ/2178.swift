// BOJ 2178
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

var map = [[Int]]()
var dist = Array(repeating: Array(repeating: -1, count: m), count: n)

for _ in 0..<n {
    map.append(Array(readLine()!).map { return Int(String($0))! })
}

var queue = [(Int, Int)]()
dist[0][0] = 1
queue.append((0, 0))
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

while !queue.isEmpty {
    let cur = queue.removeFirst()
    for i in 0..<4 {
        let nx = cur.0 + dx[i]
        let ny = cur.1 + dy[i]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
        if dist[nx][ny] != -1 || map[nx][ny] == 0 { continue }
        
        dist[nx][ny] = dist[cur.0][cur.1] + 1
        queue.append((nx, ny))
    }
}


print(dist[n-1][m-1])
