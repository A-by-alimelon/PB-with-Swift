//
//  2178.swift
//  
//
//  Created by A on 2020/09/15.
//

import Foundation
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

var graph = [[Int]]()
for _ in 0..<n {
    graph.append(Array(readLine()!).map { return Int(String($0))! })
}

var dx = [-1, 1, 0, 0]
var dy = [0, 0, -1, 1]

func bfs(_ x: Int, _ y: Int) -> Int {
   var queue = [(Int, Int)]()
    queue.append((x, y))
    while !queue.isEmpty {
        var (x, y) = queue.removeFirst()
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            if graph[nx][ny] == 0 {
                continue
            }
            if graph[nx][ny] == 1 {
                graph[nx][ny] = graph[x][y] + 1
                queue.append((nx, ny))
            }
        }
    }
    return graph[n-1][m-1]
}

print(bfs(0, 0))
