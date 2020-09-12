//
//  DFSBFS.swift
//  
//
//  Created by A on 2020/09/13.
//

import Foundation

// MARK: - DFS (인접 리스트)
func dfs(graph: [[Int]], v: Int, visited: inout [Bool]) {
    visited[v] = true
    print("\(v)", terminator: " ")
    for i in graph[v] {
        if !visited[i] {
            dfs(graph: graph, v: i, visited: &visited)
        }
    }
    
}

// MARK: - BFS
func bfs(graph: [[Int]], start: Int, visited: inout [Bool]) {
    var queue = [start]
    visited[start] = true
    while !queue.isEmpty {
        let v = queue.removeFirst()
        print("\(v)", terminator: " ")
        for i in graph[v] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}


let graph = [[], [2, 3, 8], [1, 7], [1, 4, 5], [3, 5], [3, 4], [7], [2, 6, 8], [1, 7]]
var visited = Array(repeating: false, count: 9)

dfs(graph: graph, v: 1, visited: &visited)
print()

visited = Array(repeating: false, count: 9)

bfs(graph: graph, start: 1, visited: &visited)
print()
