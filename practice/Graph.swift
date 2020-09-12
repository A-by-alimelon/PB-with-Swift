//
//  Graph.swift
//  
//
//  Created by A on 2020/09/13.
//

import Foundation

// MARK: - 인접 행렬 방식 그래프
let INF = 999999999
let graph = [[0, 7, 5], [7, 0, INF], [5, INF]]

// MARK: - 인접 리스트 방식 그래프
var graph2 = Array(repeating: [(Int, Int)](), count: 3)
graph2[0].append((1,7))
graph2[0].append((2,5))
graph2[1].append((0,7))
graph2[2].append((0,5))

print(graph)
print(graph2)
