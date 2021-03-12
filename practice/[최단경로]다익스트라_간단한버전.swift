/// 간단한 다익스트라 알고리즘 구현
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
// n = 노드 개수, m = 간선 개수
let n = inputs[0], m = inputs[1]

let start = Int(readLine()!)!
var graph = Array(repeating: [(Int, Int)](), count: n + 1)
var visited = Array(repeating: false, count: n + 1)
var distance = Array(repeating: Int.max, count: n + 1)

for _ in 0..<m {
    let values = readLine()!.split(separator: " ").map { return Int($0)! }
    let a = values[0], b = values[1], c = values[2]
    
    // a-b 사이의 거리 c 저장
    graph[a].append((b, c))
}

// 방문하지 않은 노드 중 최단 거리의 노드 번호 반환
func getSmallestNode() -> Int {
    var min = Int.max
    var index = 0
    for i in 1..<n + 1 {
        if distance[i] < min && !visited[i] {
            min = distance[i]
            index = i
        }
    }
    return index
}

func dijkstra(_ start: Int) {
    // 시작 노드에 대한 초기화
    distance[start] = 0
    visited[start] = true
    
    for j in graph[start] {
        distance[j.0] = j.1
    }
    
    // 시작 노드를 제외한 전체 노드에 대해 최단 거리 계산
    for _ in 0..<n-1 {
        let now = getSmallestNode()
        visited[now] = true
        for j in graph[now] {
            let cost = distance[now] + j.1
            if cost < distance[j.0] {
                distance[j.0] = cost
            }
        }
    }
}

dijkstra(start)

for i in 1..<n+1 {
    if distance[i] == Int.max {
        print("INFINITY")
    } else {
        print(distance[i])
    }
}
