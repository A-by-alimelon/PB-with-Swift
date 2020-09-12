//
//  5585.swift
//  
//
//  Created by A on 2020/09/12.
//

import Foundation
var n = Int(readLine()!)!
var count = 0
var change = 1000 - n
let coin_types = [500, 100, 50, 10, 5, 1]

for coin in coin_types {
    count += Int( change / coin )
    change %= coin
}

print(count)
