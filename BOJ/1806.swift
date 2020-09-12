//
//  1806.swift
//  
//
//  Created by A on 2020/09/08.
//

import Foundation
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0]
let s = inputs[1]

var numbers = readLine()!.split(separator: " ").map { return Int($0)! }
var results = [Int]()

func findCases() {
    var startPoint = 0
    var endPoint = 0
    var sum = 0
    var min = 99999
    var isAble = false
    
    while true {
        if sum >= s {
            isAble = true
            sum -= numbers[startPoint]
            startPoint += 1
            if endPoint - startPoint + 1 < min {
                min = endPoint - startPoint + 1
            }
        } else if endPoint == n { break }
        else {
            sum += numbers[endPoint]
            endPoint += 1
        }
    }
    if isAble { print(min) }
    else { print(0) }
}

findCases()
