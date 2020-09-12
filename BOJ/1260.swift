//
//  1260.swift
//  
//
//  Created by A on 2020/09/13.
//

import Foundation
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1], v = inputs[2] - 1

var graph = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)


for _ in 0..<m {
    let vertexes = readLine()!.split(separator: " ").map { return Int($0)! }
    let vertex1 = vertexes[0], vertex2 = vertexes[1]
    graph[vertex1 - 1].append(vertex2 - 1)
    graph[vertex2 - 1].append(vertex1 - 1)
}

for i in 0..<n {
    graph[i] = graph[i].sorted()
}

dfs(graph: graph, start: v, visited: &visited)
print()
visited = Array(repeating: false, count: n)
bfs(graph: graph, start: v, visited: &visited)
print()


func dfs(graph: [[Int]], start: Int, visited: inout [Bool]) {
    visited[start] = true
    print("\(start + 1)", terminator: " ")
    for i in graph[start] {
        if !visited[i] {
            visited[i] = true
            dfs(graph: graph, start: i, visited: &visited)
        }
    }
}


func bfs(graph: [[Int]], start: Int, visited: inout [Bool]) {
    var queue = [start]
    visited[start] = true
    while !queue.isEmpty {
        let v = queue.removeFirst()
        print("\(v + 1)", terminator: " ")
        for i in graph[v] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}
