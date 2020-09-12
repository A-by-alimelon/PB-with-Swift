//
//  StackQueue.swift
//  
//
//  Created by A on 2020/09/12.
//

import Foundation

// MARK: - stack
var stack = [Int]()
stack.append(5)
stack.append(2)
stack.append(3)
stack.append(7)
stack.popLast()
stack.append(1)
stack.append(4)
stack.popLast()

print(stack)
stack = stack.reversed()
print(stack)

// MARK: - queue
var queue = [Int]()
queue.append(5)
queue.append(2)
queue.append(3)
queue.append(7)
queue.removeFirst()
queue.append(1)
queue.append(4)
queue.removeFirst()

print(queue)
queue = queue.reversed()
print(queue)
