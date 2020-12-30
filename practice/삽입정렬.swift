var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in 1..<array.count {
    for j in (1..<i).reversed() {
        if array[j] < array[j-1] {
            array.swapAt(j, j-1)
        } else { break }
    }
}

print(array)