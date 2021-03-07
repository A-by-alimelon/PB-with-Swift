// 처음 위치를 찾는 이진 탐색 함수
func first(array: [Int], target: Int) -> Int? {
    var start = 0, end = array.count - 1

    while start <= end {
        let mid = (start + end) / 2
  
        if (mid == 0 || target > array[mid - 1]) && array[mid] == target {
            return mid
        } else if array[mid] >= target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return nil
}

// 마지막 위치를 찾는 이진 탐색 함수
func last(array: [Int], target: Int) -> Int? {
    var start = 0, end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        if (mid == array.count - 1 || array[mid + 1] > target) && array[mid] == target {
            return mid
        } else if array[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return nil
}

// 개수 세는 함수
func count(array: [Int], target: Int) -> Int {

    guard let firstIndex = first(array: array, target: target) else {
        return -1
    }
    
    let lastIndex = last(array: array, target: target)!
    
    return lastIndex - firstIndex + 1
}

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], x = inputs[1]

var array = readLine()!.split(separator: " ").map { return Int($0)! }

print(count(array: array, target: x))
