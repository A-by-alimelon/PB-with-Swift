func comb(_ selected: [Int]) {
        
        for i in 0..<selected.count {
            if selected[i] >= count[i] {
                return
            }
        }
        
        cases.append(selected)
        
        var temp = selected
        for i in 0..<temp.count {
            temp[i] = temp[i] + 1
            comb(temp)
        }
    }
    
    comb(Array(repeating: 0, count: n))