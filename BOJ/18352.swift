import Foundation

func bfs(graph: [[Int]], start: Int, distance: inout [Int]) {
    var queue = [start]
    var curIdx = 0
    while curIdx < queue.count {
        let v = queue[curIdx]
        curIdx += 1
        for i in graph[v] {
            if distance[i] == -1 {
                distance[i] = distance[v] + 1
                queue.append(i)
            }
        }
    }
}

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1], k = inputs[2], x = inputs[3]

var graph = Array(repeating: [Int](), count: n + 1)
var distance: [Int] = Array(repeating: -1, count: n + 1)
distance[x] = 0

for _ in 0..<m {
    let vertexes  = readLine()!.split(separator: " ").map { return Int($0)! }
    graph[vertexes[0]].append(vertexes[1])
}


bfs(graph: graph, start: x, distance: &distance)
var check = false
distance.enumerated().forEach {
    if $0.element == k {
        check = true
        print ($0.offset)
    }
}
if check == false {
   print(-1)
}