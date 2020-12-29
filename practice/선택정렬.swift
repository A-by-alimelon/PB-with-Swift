
// 시간복잡도 O(n^2)
var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in 0..<array.count {
    var min_index = i
    for j in i+1..<array.count {
        if array[min_index] > array[j] {
            min_index = j
        }
    }
    array.swapAt(i, min_index)
}

print(array)
