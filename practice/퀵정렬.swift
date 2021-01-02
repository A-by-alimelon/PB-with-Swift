// 일반적 구현
func quickSort(array: inout [Int], start: Int, end: Int) {
    guard start < end else { return }

    let pivot = start
    var left = start + 1
    var right = end
    while left <= right {
        while left <= end && array[left] <= array[pivot] {
            left += 1
        }
        while right > start && array[right] >= array[pivot] {
            right -= 1
        }
        if left > right {
            array.swapAt(right, pivot)
        } else {
            array.swapAt(left, right)
        }
    }
    quickSort(array: &array, start: start, end: right - 1)
    quickSort(array: &array, start: right + 1, end: end)
}

// 고차함수 이용 
func quickSort(array: inout [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let pivot = array[0]
    let tail = array[1..<array.count]
    
    var leftSide = tail.filter { $0 <= pivot }
    var rightSide = tail.filter { $0 > pivot }
    
    return quickSort(array: &leftSide) + [pivot] + quickSort(array: &rightSide)
}
