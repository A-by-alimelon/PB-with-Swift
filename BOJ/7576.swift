// BOJ 7576
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[1], m = inputs[0]

var map = Array(repeating: [Int](), count: n)
var dist = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { return Int($0)! }
}

var queue = [(Int, Int)]()
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 1 {
            queue.append((i, j))
        }
        if map[i][j] == 0 {
            dist[i][j] = -1
        }
    }
}

while !queue.isEmpty {
    let cur = queue.removeFirst()
    
    for k in 0..<4 {
        let nx = cur.0 + dx[k]
        let ny = cur.1 + dy[k]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
        if dist[nx][ny] >= 0 { continue }
        
        dist[nx][ny] = dist[cur.0][cur.1] + 1
        queue.append((nx, ny))
    }
}

var mx = 0
var check = true

for i in 0..<n {
    for j in 0..<m {
        if dist[i][j] == -1 {
            check = false
            break
        }
        mx = max(dist[i][j], mx)
    }
}

print(check ? mx : -1)


