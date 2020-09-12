////
////  순열조합.swift
////  ProblemSolving
////
////  Created by A on 2020/09/06.
////  Copyright © 2020 alimelon. All rights reserved.
////
//
//import Foundation
////var arr = Array(repeating: 0, count: 10)
////var check = Array(repeating: false, count: 10)
//
//func permutation(_ cnt: Int) {
//    if cnt == m {
//        for i in 0..<m {
//            print(arr[i], terminator: " ")
//        }
//        print()
//        return
//    }
//    for j in 1...n {
//        if !check[j] {
//            check[j] = true
//            arr[cnt] = j
//            permutation(cnt + 1)
//            check[j] = false
//        }
//    }
//}
//
//
//func combination(_ cnt: Int, _ a: Int) {
//    if cnt == m {
//        for i in 0..<m {
//            print(arr[i] + 1, terminator: " ")
//        }
//        print()
//        return
//    }
//    for j in a..<n {
//        if !check[j] {
//            check[j] = true
//            arr[cnt] = j
//            combination(cnt + 1, j)
//            check[j] = false
//        }
//    }
//
//}
//
//var arr1 = Array(repeating: "1", count: n)
//
//func permutationWithRepetition(_ cnt: Int) {
//    if cnt == m {
//        print(arr1.joined(separator: " "))
//        return
//    }
//
//    for j in 1...n {
//        arr1[cnt] = String(j)
//        permutationWithRepetition(cnt + 1)
//
//    }
//}
//
//func combinationWithRepetition(_ cnt: Int, _ a: Int) {
//    if cnt == m {
//        for i in 0..<m {
//            print(arr[i] + 1, terminator: " ")
//        }
//        print()
//        return
//    }
//    for j in a..<n {
//        arr[cnt] = j
//        combinationWithRepetition(cnt + 1, j)
//
//    }
//
//}



//let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
//let n = inputs[0]
//let m = inputs[1]
//
//var graph = [[Int]]()
//for _ in 0..<n {
//    graph.append(Array(readLine()!).map { Int(String($0))! })
//}
//
//func dfs(_ x: Int, _ y: Int) -> Bool {
//    if x <= -1 || x >= n || y <= -1 || y >= m {
//        return false
//    }
//    if graph[x][y] == 0 {
//        graph[x][y] = 1
//        dfs(x - 1, y)
//        dfs(x, y - 1)
//        dfs(x + 1, y)
//        dfs(x, y + 1)
//        return true
//    }
//    return false
//}
//
//var result = 0
//for i in 0..<n {
//    for j in 0..<m {
//        if dfs(i, j) == true {
//            result += 1
//        }
//    }
//}
//print(result)
