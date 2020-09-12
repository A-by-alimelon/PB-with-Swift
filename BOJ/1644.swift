//
//  1644.swift
//  
//
//  Created by A on 2020/09/06.
//

import Foundation
let n = Int(readLine()!)!
var numbers = Array(repeating: 1, count: n + 1)
var primeNumbers = [Int]()

func makePrimeNumbers() {
    if n == 1 { return }
    for i in 2...n {
        if numbers[i] == 0 { continue }
        for j in stride(from: i + i, to: n + 1, by: i) {
            if numbers[j] == 0 { continue }
            numbers[j] = 0
        }
    }
    
    numbers.enumerated().forEach {
        if $0.element != 0 && $0.offset > 1 {
            primeNumbers.append($0.offset)
        }
    }
    //print(primeNumbers)
}

func findCases() {
    var startPoint = 0
    var endPoint = 0
    var cases = 0
    var sum = 0
    
    while true {
        if sum >= n {
            sum -= primeNumbers[startPoint]
            startPoint += 1
        }
        else if endPoint == primeNumbers.count { break }
        else {
            sum += primeNumbers[endPoint]
            endPoint += 1
        }
        if sum == n { cases += 1 }
    }
    
    print(cases)
}

makePrimeNumbers()
findCases()
