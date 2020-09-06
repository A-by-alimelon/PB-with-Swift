//
//  2960.swift
//  
//
//  Created by A on 2020/09/06.
//

import Foundation
let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0]
let k = inputs[1]
var count = 0
var arr = Array(repeating: 1, count: n + 1)

for i in 2...n {
    if arr[i] == 0 { continue }
    for j in stride(from: i, to: n + 1, by: i) {
        if arr[j] == 0 { continue }
        count += 1
        if count == k {
            print(j)
            break
        }
        arr[j] = 0
    }
}
