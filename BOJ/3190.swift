let n = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 0, count: n), count: n)

let k = Int(readLine()!)!
for _ in 0..<k {
    let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
    map[inputs[0] - 1][inputs[1] - 1] = 1
}

let l = Int(readLine()!)!
var steps = [(Int, String)]()
for _ in 0..<l {
    let inputs = readLine()!.split(separator: " ").map { return String($0) }
    steps.append((Int(inputs[0])!, inputs[1]))
}

var time = 0
var snake = [(0, 0)]
var direction = 0
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

map[0][0] = -1

while true  {
    
    if time == steps.first?.0 {
        turn(steps.first!.1)
        steps.removeFirst()
    }
    
    let nx = snake.first!.0 + dx[direction]
    let ny = snake.first!.1 + dy[direction]

    if nx > n - 1 || ny > n - 1 || nx < 0 || ny < 0 || map[nx][ny] == -1 {
        time += 1
        break
    }

    if map[nx][ny] == 0 {
        map[snake.last!.0][snake.last!.1] = 0
        snake.removeLast()
    }
    
    snake.insert((nx, ny), at: 0)
    map[nx][ny] = -1
    time += 1
}

func turn(_ dir: String) {
    if dir == "L" {
        direction -= 1
        if direction < 0 {
            direction = 3
        }
    } else {
        direction += 1
        if direction > 3 {
            direction = 0
        }
    }
}

print(time)