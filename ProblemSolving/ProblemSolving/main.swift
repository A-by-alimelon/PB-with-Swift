//
//  main.swift
//  ProblemSolving
//
//  Created by A on 2020/09/04.
//  Copyright © 2020 alimelon. All rights reserved.
//

import Foundation


let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0]
let m = inputs[1]
let numbers = readLine()!.split(separator: " ").map { return Int($0)! }

var startIndex = 0
var endIndex = 0
var result = 0
var sum = 0

while true {
    if sum >= m {
        sum -= numbers[startIndex]
        startIndex += 1
    }
    else if endIndex == n { break }
    else {
        sum += numbers[endIndex]
        endIndex += 1
    }
    if sum == m { result += 1}
}

print(result)
