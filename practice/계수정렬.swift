let array = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]

var count = Array(repeating: 0, count: array.max()! + 1)

for i in 0..<array.count {
    count[array[i]] += 1
}

for i in 0..<count.count {
    for _ in 0..<count[i] {
        print(i, terminator: " ")
    }
}