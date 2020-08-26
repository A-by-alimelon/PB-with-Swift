//
//  MockTest.swift
//  
//
//  Created by A on 2020/08/27.
//

import Foundation

let one = [1,2,3,4,5]
let two = [2,1,2,3,2,4,2,5]
let three = [3,3,1,1,2,2,4,4,5,5]

func solution(_ answers:[Int]) -> [Int] {
    var count = [1: 0, 2: 0, 3: 0]
    var ans = [Int]()
    for n in 0..<answers.count {
        if answers[n] == one[n % one.count] {
            count[1]! += 1
        }
        if answers[n] == two[n % two.count] {
            count[2]! += 1
        }
        if answers[n] == three[n % three.count] {
            count[3]! += 1
        }
    }
    for (num, cnt) in count {
        if cnt == count.values.max()! {
            ans.append(num)
        }
    }
    
    return ans.sorted()
}
