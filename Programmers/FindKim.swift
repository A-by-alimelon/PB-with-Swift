//
//  FindKim.swift
//  
//
//  Created by A on 2020/08/29.
//

import Foundation

func solution(_ seoul:[String]) -> String {
    var idx = 0
    seoul.enumerated().forEach {
        if $0.element == "Kim" {
            idx  = $0.offset
            return
        }
    }
    return "김서방은 \(idx)에 있다"
}
