import Foundation

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
var n = inputs[0], m = inputs[1]

var graph = Array(repeating: [Int](), count: n)
var tempGraph = [[Int]]()
var safeZone = 0

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for i in 0..<n {
    graph[i].append(contentsOf: readLine()!.split(separator: " ").map { return Int($0)! })
}

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 0 {
            tempGraph = graph
            tempGraph[i][j] = 1
            makeWall(count: 1)
            tempGraph[i][j] = 0
        }
    }
}

print(safeZone)

func makeWall(count: Int) {
    if count == 3 {
        bfs()
        return
    }
    for i in 0..<n {
        for j in 0..<m {
            if tempGraph[i][j] == 0 {
                tempGraph[i][j] = 1
                makeWall(count: count + 1)
                tempGraph[i][j] = 0
            }
        }
    }
}

func bfs() {
    var queue = [(Int, Int)]()
    var virusGraph = tempGraph
    for i in 0..<n {
        for j in 0..<m {
            if virusGraph[i][j] == 2 {
                queue.append((i, j))
            }
        }
    }
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        for i in 0..<4 {
            let x = now.0 + dx[i]
            let y = now.1 + dy[i]
            if 0 <= x && x < n && 0 <= y && y < m {
                if virusGraph[x][y] == 0 {
                    virusGraph[x][y] = 2
                    queue.append((x, y))
                }
            }
        }
    }
    
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if virusGraph[i][j] == 0 {
                count += 1
            }
        }
    }
    
    safeZone = max(safeZone, count)
}
