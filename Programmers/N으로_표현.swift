var D = Array(repeating: Set<Int>(), count: 9)

func solution(_ N: Int, _ number: Int) -> Int {
    for i in 1..<9 {
        let nNumber = makeStringNumber(N, i)
        D[i].insert(nNumber)
        for j in 1..<i {
            for k in D[j] {
                for l in D[i-j] {
                    D[i].insert(k+l)
                    D[i].insert(k-l)
                    D[i].insert(k*l)
                    if l != 0 {
                        D[i].insert(k/l)
                    }
                }
            }
        }
        if D[i].contains(number) {
            return i
        }
    }
    return -1
}

func makeStringNumber(_ N: Int,_ count: Int) -> Int {
    var stringNumber = ""
    for _ in 0..<count {
        stringNumber += String(N)
    }
    return Int(stringNumber)!
}