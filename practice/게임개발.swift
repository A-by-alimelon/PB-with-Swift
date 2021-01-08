let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

let characterInputs = readLine()!.split(separator: " ").map { return Int($0)! }
var (x, y) = (characterInputs[1], characterInputs[0])
var direction = characterInputs[2]

var map = Array(repeating: [Int](), count: n)

for i in 0..<n {
    map[i].append(contentsOf: readLine()!.split(separator: " ").map { return Int($0)! })
}

map[x][y] = 1

var count = 1
let steps = [(-1, 0), (0, 1), (1, 0), (0, -1)]
var turnCount = 0

while(true) {
    direction = turnLeft()
    
    let nx = x + steps[direction].0
    let ny = y + steps[direction].1

    if nx < m + 1 && nx > 0 && ny < n + 1 && ny > 0 && map[nx][ny] == 0 {
        map[nx][ny] = 1
        x = nx
        y = ny
        count += 1
        turnCount = 0
    } else {
        turnCount += 1
        
        if turnCount == 4 {
            let nx = x - steps[direction].0
            let ny = y - steps[direction].1
            turnCount = 0
            if map[nx][ny] == 1 {
                break
            }
        }
        
    }
}

func turnLeft() -> Int {
    if direction == 0 {
        return 3
    } else {
        return direction - 1
    }
}

print(count)