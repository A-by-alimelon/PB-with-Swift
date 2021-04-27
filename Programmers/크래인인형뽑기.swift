// 크레인 인형뽑기 게임
func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var bucket = [Int]()
    var board = board
    var result = 0
    
    moves.forEach { move in
        for i in 0..<board.count {
            if board[i][move-1] != 0 {
                if bucket.last == board[i][move-1] {
                    bucket.removeLast()
                    result += 2
                } else {
                    bucket.append(board[i][move-1])
                }
                board[i][move-1] = 0
                break
            }
        }
        
    }
    return result
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))