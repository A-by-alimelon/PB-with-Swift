/// 전보
struct Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        return lhs.distance < rhs.distance
    }

    var distance: Int
    var dest: Int
}

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1], c = inputs[2]

var graph = Array(repeating: [(Int, Int)](), count: n + 1)
var distance = Array(repeating: Int.max, count: n + 1)

for _ in 0..<m {
    let values = readLine()!.split(separator: " ").map { return Int($0)! }
    let x = values[0], y = values[1], z = values[2]
    // x -> y 로 가는데 z시간이 걸리는 통로가 있다
    graph[x].append((y, z))
}

func dijkstra(_ start: Int) {
    var heap = MinHeap(Data(distance: 0, dest: start))
    distance[start] = 0
    while !heap.isEmpty() {
        guard let now = heap.pop() else { return }
        
        if distance[now.dest] < now.distance {
            continue
        }
        
        for i in graph[now.dest] {
            let cost = now.distance + i.1
            if cost < distance[i.0] {
                distance[i.0] = cost
                heap.insert(Data(distance: cost, dest: i.0))
            }
        }
    }
}

dijkstra(c)
var count = 0
var max_distance = 0
for d in distance {
    if d != Int.max {
        count += 1
        max_distance = max(max_distance, d)
    }
}

print(count - 1, max_distance)