let INF = 987654321
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

var graph = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

// 자기 자신으로 가는 거리 0으로 초기화
for i in 1..<n + 1 {
    for j in 1..<n + 1 {
        if i == j {
            graph[i][j] = 0
        }
    }
}

// 간선 정보 입력받아 초기화
for _ in 0..<m {
    let values = readLine()!.split(separator: " ").map { return Int($0)! }
    let a = values[0], b = values[1]
    
    graph[a][b] = 1
    graph[b][a] = 1
}

let inputs2 = readLine()!.split(separator: " ").map { return Int($0)! }
let x = inputs2[0], k = inputs2[1]

// 플루이드 워셜 알고리즘 수행 (3중 for문)
for k in 1..<n + 1 {
    for a in 1..<n + 1 {
        for b in 1..<n + 1 {
            // 점화식 수행
            graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
        }
    }
}

let distance = graph[1][k] + graph[k][x]
if distance >= INF {
    print(-1)
} else {
    print(distance)
}
