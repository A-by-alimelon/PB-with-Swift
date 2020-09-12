//
//  RecursiveFunction.swift
//  
//
//  Created by A on 2020/09/12.
//

import Foundation
// MARK: - 재귀 함수

func recursive_function(i: Int) {
    if i == 100 { return }
    print("\(i)번째 재귀 함수에서 \(i+1)번째 재귀 함수를 호출 합니다")
    recursive_function(i: i + 1)
    print("\(i)번째 재귀 함수를 종료합니다")
}

recursive_function(i: 1)

// MARK: - 반복적으로 구현한 팩토리얼
func factorial_iterative(n: Int) -> Int {
    var result = 1
    for i in 1..<n+1 {
        result *= i
    }
    return result
}

// MARK: - 재귀적으로 구현한 팩토리얼
func factorial_recursive(n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    return n * factorial_recursive(n: n - 1)
}

print("반복적으로 구현: \(factorial_iterative(n: 5))")
print("재귀적으로 구현: \(factorial_recursive(n: 5))")
