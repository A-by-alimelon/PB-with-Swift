//
//  KthNumber.swift
//  
//
//  Created by A on 2020/08/29.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ans = [Int]()
    commands.forEach {
        let start = $0[0]-1
        let end = $0[1]-1
        ans.append(array[start...end].sorted()[$0[2]-1])
    }
    return ans
}
