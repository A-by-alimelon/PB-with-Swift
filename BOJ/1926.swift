// BOJ 1926
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

var map = Array(repeating: [Int](), count: n)
var visit = Array(repeating: Array(repeating: 0, count: m), count: n)
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var paintings = [Int]()

for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { return Int($0)! }
}

for i in 0..<n {
    for j in 0..<m {
        var queue = [(Int, Int)]()
        var count = 0
        
        if map[i][j] != 1 || visit[i][j] == 1 { continue }
        visit[i][j] = 1
        queue.append((i, j))
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            count += 1
            for k in 0..<4 {
                let nx = cur.0 + dx[k]
                let ny = cur.1 + dy[k]
                if nx < 0 || nx >= n || ny < 0 || ny >= m { continue }
                if visit[nx][ny] == 1 || map[nx][ny] != 1 { continue }
                visit[nx][ny] = 1
                queue.append((nx, ny))
            }
        }
        paintings.append(count)
    }
}

print(paintings.count)
print(paintings.isEmpty ? 0 : paintings.max()!)