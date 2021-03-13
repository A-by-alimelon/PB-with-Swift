/// 개선된(시간) 다익스트라 알고리즘 구현
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
// n = 노드 개수, m = 간선 개수
let n = inputs[0], m = inputs[1]

let start = Int(readLine()!)!
var graph = Array(repeating: [(Int, Int)](), count: n + 1)
var distance = Array(repeating: Int.max, count: n + 1)

for _ in 0..<m {
    let values = readLine()!.split(separator: " ").map { return Int($0)! }
    let a = values[0], b = values[1], c = values[2]

    // a-b 사이의 거리 c 저장
    graph[a].append((b, c))
}

func dijkstra(_ start: Int) {
    var heap = MinHeap(Data(distance: 0, dest: start))
    distance[start] = 0
    while !heap.isEmpty() {
        guard let nowData = heap.pop() else { return }
        
        if distance[nowData.dest] < nowData.distance {
            continue
        }
        for i in graph[nowData.dest] {
            let cost = nowData.distance + i.1
            if cost < distance[i.0] {
                distance[i.0] = cost
                heap.insert(Data(distance: cost, dest: i.0))
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
