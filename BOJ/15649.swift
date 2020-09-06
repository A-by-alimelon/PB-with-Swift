//
//  15649.swift
//  
//
//  Created by A on 2020/09/04.
//

var arr = Array(repeating: 0, count: 10)
var check = Array(repeating: false, count: 10)

func permutation(_ cnt: Int) {
    if cnt == m {
        for i in 0..<m {
            print(arr[i], terminator: " ")
        }
        print()
        return
    }
    for j in 1...n {
        if !check[j] {
            check[j] = true
            arr[cnt] = j
            permutation(cnt + 1)
            check[j] = false
        }
    }
}

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0]
let m = inputs[1]
permutation(0)
