//
//  main.swift
//  ProblemSolving
//
//  Created by A on 2020/09/04.
//  Copyright © 2020 alimelon. All rights reserved.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1], k = inputs[2], x = inputs[3]

var graph = Array(repeating: [Int](), count: n + 1)
var distance: [Int] = Array(repeating: -1, count: n + 1)
distance[x] = 0

for _ in 0..<m {
    let vertexes  = readLine()!.split(separator: " ").map { return Int($0)! }
    graph[vertexes[0]].append(vertexes[1])
}

//func dfs(graph: [[Int]], v: Int, visited: inout [Bool]) {
//    visited[v] = true
//    print("\(v)", terminator: " ")
//    for i in graph[v] {
//        if !visited[i] {
//            dfs(graph: graph, v: i, visited: &visited)
//        }
//    }
//}
//


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

struct QueueWithLinkedList<T> {
    var isEmpty: Bool {
        return self.linkedList.isEmpty
    }
    
    var front: T? {
        return self.linkedList.head?.value
    }
    
    mutating func enqueue(_ item: T) {
        self.linkedList.appendValue(item)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        return self.linkedList.removeHead()
    }
    var linkedList = LinkedList<T>()
}

class LilnkedListNode<T> {
    let value: T
    weak var previous: LilnkedListNode?
    var next: LilnkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

struct LinkedList<T> {
    var isEmpty: Bool {
        return self.head == nil
    }
    
    mutating func appendValue(_ value: T) {
        let new = LilnkedListNode<T>(value: value)
        
        if self.isEmpty {
            self.head = new
        }
        
        self.tail?.next = new
        new.previous = self.tail
        self.tail = new
    }
    
    mutating func removeHead() -> T? {
        guard let head = self.head else { return nil }
        return self.removeNode(head)
    }
    
    mutating func removeNode(_ node: LilnkedListNode<T>) -> T {
        node.previous?.next = node.next
        node.next?.previous = node.previous
        if self.head === node { self.head = nil }
        if self.tail === node { self.tail = nil }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    private(set) var head: LilnkedListNode<T>?
    private var tail: LilnkedListNode<T>?
}


public func measureTime(_ closure: () -> ()) -> TimeInterval {
    let startDate = Date()
    closure()
    return Date().timeIntervalSince(startDate)
}


