// 경주로 건설
struct Load {
    var x: Int
    var y: Int
    
    // dir이 0이면 가로, 1이면 세로 방향
    var dir: Int
}

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    var cost = Array(repeating: Array(repeating: -1, count: n), count: n)
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    cost[0][0] = 0
    var queue = [(Load)]()
    if board[0][1] != 1 {
        queue.append(Load(x: 0, y: 1, dir: 0))
        cost[0][1] = 100
    }
    
    if board[1][0] != 1 {
        queue.append(Load(x: 1, y: 0, dir: 1))
        cost[1][0] = 100
    }

    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = cur.x + dx[i]
            let ny = cur.y + dy[i]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= n || board[nx][ny] == 1 {
                continue
            }
            
            var tempCost = cost[cur.x][cur.y]
            if abs(dx[i]) != cur.dir {
                tempCost += 600
            } else {
                tempCost += 100
            }
            
            if cost[nx][ny] == -1 || tempCost <= cost[nx][ny] {
                cost[nx][ny] = tempCost
                queue.append(Load(x: nx, y: ny, dir: dx[i] == 0 ? 0 : 1))
            }
        }
    }

    return cost[n-1][n-1]
}