//
//  NaturalNumberArray.swift
//  
//
//  Created by A on 2020/08/27.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    var ans = [Int]()
    let numToStr = String(n)
    numToStr.reversed().forEach {
        ans.append(Int(String($0))!)
    }
    return ans
}
